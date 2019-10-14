# SHA Version Action
This action updates the version of your package according to the SHA of the current commit.

# Usage
```yaml
jobs:
  sha-version:
    name: SHA Version
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Update Package Version with Commit SHA
      uses: taras/georgia/.github/actions/sha-version@release-1.0.0
```