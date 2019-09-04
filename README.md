The second version of Georgia is to refactor V1 into main.workflow.

# TODO
- [ ] See how custom actions are integrated into the GUI
- [ ] Write dockerfiles
- [ ] Environment passing between actions
- [ ] Secrets
- [ ] Migrate create-pr.yml from v1
- [ ] Migrate pr-merged.yml from v1

<!-- # Questions
- [ ] Use a Docker account?
  - [ ] vs using CLI to install the files onto the repo
- [ ] Monorepo?
  - [ ] Purpose is to install it once and applied to all its children?
  - [ ] Alternative is to install per repo in an organization?
- [ ] How to make lint/test/coverage settings suitable for any repos? -->

# Setup Instructions (OLD)
1. Add the following in secrets:
    - DANGER_GITHUB from bot token (public repo)
    - NPM_AUTH_TOKEN from npmjs
    - GITHUB_TOKEN from github account for auto-committing. (currently set to mk_token)
    - optional: SEMVER_USER_NAME / SEMVER_USER_EMAIL 
      (if not supplied then git config will take information from `package.json`)

2. Customize test jobs in both workflows