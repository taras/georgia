1. see if workflow is triggered on merge
2. get danger working
3. npm version updating

<!-- # Continuous-Semver
![CI Workflow](https://user-images.githubusercontent.com/29791650/63278257-f7267b80-c274-11e9-8127-c20af8aba502.png)

## Prerequisite
- Github repo of your project
- Separate Github account for comment bot
- NPM account
- CircleCI account

## Setup
1. Assuming you already have your repo on Github, you will then need to go to CircleCI and add your project. Select `linux/node` and click `Start building`.

2. Go to your repo and create `/.circleci/config.yml`. Copy over the config file we have [here](/.circleci/config.yml).

3. Update `package.json`:
    - The `name` and `version` of your package.json is what is used to publish onto NPM.

4. Add necessary tokens to your CircleCI Environment Variables (Settings -> Projects -> YOUR_PROJECT Settings -> Environment Variables):
    - NPM: generate a `Read/Publish` token from your NPM account and add to your environment variables as `NPM_TOKEN`.

    - Github: in your Github account, navigate to Settings -> Developer settings -> Personal access tokens and generate a new token with `repo` checked. Add this token as `GITHUB_TOKEN`.

    - Danger: in your separate Github bot account generate another personal access token the same way as above with only `public_repo` checked. Add this to your Environment Variables as `DANGER_GITHUB_API_TOKEN`.

    - Fingerprint: in your CircleCI, navigate to Settings -> Projects -> YOUR_PROJECT Settings -> Checkout SSH keys. Create a user key and add that to your Environment Variables as `FINGERPRINT`.

    - Username/Email (OPTIONAL): this is for `git config`, set the environment variables as `SEMVER_USER_NAME` and `SEMVER_USER_EMAIL` to correlate with your Github account. If these two variables are not set, they will default to `undefined` and will still work.

5. Copy over [dangerfile.js](/.circleci/dangerfile.js) to `/.circleci/`. You can customize the auto-generated comment your bot will make in your PR in this file. Click [here](https://danger.systems/js/reference.html) for more information on how to use DangerJS.

6. Go to Advanced Settings in your CircleCI (Settings -> Projects -> YOUR_PROJECT Settings -> Advanced Settings) and turn on `Only build pull request`.

That's it! If you have any questions or if the steps above are causing any issues for you, please reach out to us. -->