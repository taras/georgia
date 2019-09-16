# Filter By Commit Action
This action allows you to stop your workflow based on your commit message. This is helpful in preventing endless loops of triggers if you have an auto-commit anywhere in your workflow.

## Requirements
The `filter` argument takes in the phrase/word you want to prevent your workflow from continuing.

# Usage
```yaml
jobs:
  filter:
    name: Filter by Commit Message
    runs-on: ubuntu-latest
    steps:    
    - name: Filter by Commit Message
      uses: taras/georgia/.github/actions/filter-by-commit@release-1.0.0
      with:
        filter: skip-actions
```