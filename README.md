![CI Workflow](./NEW_DIAGRAM.png)

# Checklist
- [x] Tests
- [x] Committing
- [x] Publishing

# Questions
- [ ] Use a Docker account?
  - [ ] vs using CLI to install the files onto the repo
- [ ] Monorepo?
  - [ ] Purpose is to install it once and applied to all its children?
  - [ ] Alternative is to install per repo in an organization?
- [ ] How to make lint/test/coverage settings suitable for any repos?

# Setup Instructions
1. add DANGER_GITHUB from bot token (public repo) in secrets
2. add NPM_AUTH_TOKEN from npmjs in secrets
3. add MK_TOKEN from github account that you want automatically committing <!-- update to GITHUB_TOKEN and in pr-merge >
4. add author in package.json (follow format)