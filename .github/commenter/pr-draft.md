# Motivation
Currently, Github does not provide a way to upload workflows to be reusable in multiple projects; the workflows must be manually configured for each project.

The `npm-publish-branch-preview` action is dependent on `write-npm-snapshot-version` to provide it with a unique package version number otherwise the publishing will result in an error. And `post-npm-usage-instructions-comment` is irrelevant without the first two actions.

The proposal is to combine the three actions into one. The new `publish-pr-preview` action will make it much easier to maintain/modify the workflow without having to jump between different actions to see if one update of an action breaks the functionality of other actions.

Please see [Criteria](#Criteria) below to see what needs to be addressed before this PR can be taken out of draft status.

# Approach
The flow of this action is as follows:
- Check for access to NPM token in secrets.
- Make sure this action is being run from a pull request.
- Make sure the name of the head branch of the pull request isn't `latest` to avoid conflicts with NPM tagging.
- Update package version with snapshot\
- Publish to NPM with branch name as tag.
- Comment on pull request with instructions on how to access the package.

This action will allow the workflow to look like this:
```yml
jobs:
  publish: 
    name: Publish PR Preview
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Publish PR Preview
      uses: thefrontside/actions/publish-pr-preview@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}
```
Previous workflow with the three actions looked like this:
```yml
jobs:
  preview: 
    name: Publish Preview Package
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Write NPM Snapshot Version
      uses: thefrontside/actions/write-npm-snapshot-version@master
    - name: NPM Publish Commit
      uses: thefrontside/actions/npm-publish-branch-preview@master
      env:
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}
    - name: Post Instructions Comment
      uses: thefrontside/actions/post-npm-usage-instructions-comment@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_POST_COMMENT_TOKEN }}
```

# Tradeoffs
- I can't think of any scenarios at the moment but this approach limits our usability of `GITHUB_TOKEN`. For example, we wouldn't be able to get github-actions bot to perform one action and a separate custom bot to perform another if they both utilize `GITHUB_TOKEN`.
- Customizability. Can't predict this to be an issue yet because it suits our needs and its functions are straight forward, but other teams/projects might have different criterias for their pull requests.

# Criteria
- [ ] Update message content to include instructions on how to install package using tags? See [issue #14](https://github.com/thefrontside/actions/issues/14).
- [ ] Test run the current `publish-preview` workflow on `microstates.js` to see if anything else should be added.
- [ ] Maybe run the current setup on Effection/Bigtest too before we consider adapting this new action.

# Learning
- This action was tested on [minkimcello/georgia](https://github.com/minkimcello/georgia/pull/11).