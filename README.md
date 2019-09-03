![CI Workflow](https://user-images.githubusercontent.com/29791650/64193157-31ce0d80-ce4a-11e9-99ad-fbfe2780d3ce.png)

# Checklist
- [x] Tests
- [x] Committing
- [x] Publishing

<!-- # Questions
- [ ] Use a Docker account?
  - [ ] vs using CLI to install the files onto the repo
- [ ] Monorepo?
  - [ ] Purpose is to install it once and applied to all its children?
  - [ ] Alternative is to install per repo in an organization?
- [ ] How to make lint/test/coverage settings suitable for any repos? -->

# Setup Instructions
1. Add the following in secrets:
    - DANGER_GITHUB from bot token (public repo)
    - NPM_AUTH_TOKEN from npmjs
    - GITHUB_TOKEN from github account for auto-committing. (currently set to mk_token)
    - optional: SEMVER_USER_NAME / SEMVER_USER_EMAIL 
      (if not supplied then git config will take information from `package.json`)

2. Customize test jobs in both workflows