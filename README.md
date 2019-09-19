# When PR is Created
## Actions
1. **\*NEW*** `georgia/sha-version` generates new package version using SHA. *(Updates below in Notes)*
    - Click [here](https://github.com/minkimcello/shamalamadingdong.git) to see how the action works.

2. `actions/npm` to publish

3. Generate comment on PR to expose package with `Danger/JS`. 

## Updates
### sha-version
  - `checkout` with ref arg, `head_ref` to ensure we get the latest commit of pull request.
  - removed the `skip -1` tag to get the correct SHA.
  - `--no-git-tag-version` prevents it from auto-committing each time `npm version` is called.

  - Issues:
    - If multiple commits are pushed too close to each other, the publishing/commenting is done on the latest commit which is okay except it causes an error for trying to publish the same thing multiple times.
      - `GITHUB_SHA` is the commit that triggers the workflow but it doesn't correlate with any of the commits in the PR.
        - `git log`ing will always return the latest.

# When PR is Merged
## Actions
1. ~~**\*NEW*** `georgia/filter-by-commit` to prevent the workflow from running if commit message matches the argument of this action. We're passing in `skip-action` to accommodate the auto-commit's message.~~

1. `actions/bin/filter` to run workflow on PRs that are merged. 
    - This whole workflow only runs when a PR is closed.

2. **\*NEW*** `georgia/fetch-pr-labels` retrieves and exports labels of the most recently-merged PR as an output to be accessible elsewhere in the workflow.
    - Click [here](https://github.com/minkimcello/js-action) to see how the action works.

2. **\*NEW*** `georgia/label-filter` takes an input of labels and exports it as a variable for updating package version in NPM in the next action of this workflow.
    - Click [here](https://github.com/minkimcello/label-sorter) to see how the action works.

3. `actions/npm` to update version with the label exported from the previous action.

4. **\*NEW*** `georgia/commit-and-push` is a custom action that takes in an argument for what files you want to push back to the repo. We're passing in `package.json` with its new package version.
    - Click [here](https://github.com/taras/georgia/tree/release-1.0.0/.github/actions/git-push) to see how the action works.

5. `actions/npm` to publish.

## Updates
### actions/bin/filter
  - prevents non-merged closed PRs from running this workflow

### fetch-pr-labels
  - now that the workflow runs on the PR itself, we can retrieve the labels using the PR number from the context to ensure accuracy

### commit and push
  - no longer need to fetch and updated branch to use BASE_REF.

### publishing
  - had to be kept in this workflow because commits that are triggered from the workflow does not trigger another workflow. this used to happen before but does not happen anymore. might be a quiet update.
  - the commit of the merge itself does trigger a workflow however if the workflow from the pull request after it is merged overlaps with the workflow of the merged commit, there'll be some ugly overlapping.

## Notes

By creating our own actions, we've made this workflow much more modular and re-usable.

We've gone from this:

```yaml
on:
  push:
    branches:
      - release-*
      
jobs:
  publish:
    name: Commit & Publish
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Commit & Publish
      run: |
        if [[ "$(git log -1 --pretty=%B)" =~ "[ci skip]" ]]
        then 
          echo Skipping because this commit is automated
        else
          # git setup
          git remote set-url origin https://${GITHUB_TOKEN}:x-oauth-basic@github.com/${GITHUB_REPOSITORY}.git
          git fetch origin +refs/heads/*:refs/heads/*
          branch=$(printf "%s\n" "${GITHUB_REF#*refs\/heads\/}")
          git checkout $branch
          if [ "${#SEMVER_USER_NAME}" -ne "0" -a "${#SEMVER_USER_EMAIL}" -ne "0" ]
          then
            git_config_email=$SEMVER_USER_NAME
            git_config_name=$SEMVER_USER_EMAIL
          else
            git_config_email="`node -e \"console.log(require('./package.json').author.email)\"`"
            git_config_name="`node -e \"console.log(require('./package.json').author.name)\"`"
          fi
          git config user.email $git_config_email
          git config user.name $git_config_name
          # install hub
          wget https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz
          tar -zxvf hub-linux-amd64-2.12.3.tgz
          cd hub-linux-amd64-2.12.3
          sudo ./install && cd ..
          labels=$(hub pr list -s merged -L 1 -f %L)
          # use labels to decide how to increment and publish
          if [[ "$labels" =~ "major" ]]
          then
            echo Skipping because major release should be published manually
          else 
            if [[ "$labels" =~ "minor" ]]
            then
              npm version minor --no-git-tag-version 
            else
              npm version patch --no-git-tag-version
            fi
            git add package.json
            current="`node -e \"console.log(require('./package.json').version)\"`"
            git commit -m "Release version $current [ci skip]"
            git push origin HEAD
            echo "//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN" > ~/.npmrc
            npm publish --access=public
          fi
        fi
      env:
        GITHUB_TOKEN: ${{ secrets.MK_TOKEN }} 
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}
        SEMVER_USER_NAME: ${{ secrets.SEMVER_USER_NAME }}
        SEMVER_USER_EMAIL: ${{ secrets.SEMVER_USER_EMAIL }}
```

To this:
```yaml
on:
  pull_request:
    branches:
    - release-*
    types:
    - closed

jobs:
  filter:
    name: filter
    runs-on: ubuntu-latest
    steps:
    - uses: actions/bin/filter@master
      with:
        args: "merged true"

  commit:
    name: commit
    runs-on: ubuntu-latest
    needs: filter
    steps:
    - uses: actions/checkout@v1
      with:
        ref: ${{ github.head_ref }}

    - name: list labels of last merged pr
      uses: frontside/label-retriever@master
      id: pr-labels
      with:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

    - name: filter separately (beta)
      uses: frontside/label-sorter@master
      id: filter-labels 
      with:
        LABELS: ${{ steps.pr-labels.outputs.labels }}
    
    - name: npm version using label variable
      uses: actions/npm@master
      with:
        args: version $NPM_VERSION --no-git-tag-version

    - name: commit and push to repo
      uses: frontside/git-push@master
      with:
        add: package.json
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

    - name: publish
      uses: actions/npm@master
      with:
        args: publish --access=public
      env:
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}
```

# Setup Instructions
Setup has become much simpler now:

1. add NPM_AUTH_TOKEN from npmjs in secrets

2. customize test procedures in the two workflows

3. copy/paste the two workflow files.