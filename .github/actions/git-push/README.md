# Github Push Action
This action commits the file according to the `add` argument and pushes it to your repository.

## Requirements
You must specify the file you want pushed to your repository as an `add` argument and also expose your `GITHUB_TOKEN`.

# Usage
```yaml
jobs:
  commit-push:
    name: Commit & Push
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Commit and Push to Repository
      uses: taras/georgia/.github/actions/git-push@release-1.0.0
      with:
        add: package.json
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```