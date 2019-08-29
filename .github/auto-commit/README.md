Use the GitHub action in the following way:

```
action "Filter master" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  args = "not branch master"
}

action "Some action that changes files" {
  uses = "..."
  args = "..."
}

action "Auto-commit" {
  uses = "docker://cdssnc/auto-commit-github-action"
  needs = ["Some action that changes files"]
  args = "This is an auto-commit"
  secrets = ["GITHUB_TOKEN"]
}
```

This ensures that you run your action only on a non-master branch. The `args` field is used as your commit message. To modify the commit name, copy the code and change the name in 'entrypoint.sh'.