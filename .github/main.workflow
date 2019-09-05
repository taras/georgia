workflow "PR Created" {
  on = "pull_request"
  resolves = ["echo pr created"]
}

workflow "PR Merged" {
  on = "push"
  resolves = ["second action"]
}

action "echo pr created" {
  uses = "docker://alpine"
  runs = "echo"
  args = ["pr", "created"]
}


action "echo pr merged" {
  uses = "taras/georgia/.github/actions/test2@release-2.0.0"
}

action "second action" {
  uses = "taras/georgia/.github/actions/test@release-2.0.0"
  needs = "echo pr merged"
}


# action "echoer" {
#   uses = "docker://alpine"
#   runs = "echo"
#   args = "hello"
# } # docker instead of action in uses

# action "echoer" {
#   uses = "./.github/actions/test"
# } # local action

# action "second action" {
#   needs = ["first action"]
#   uses = "taras/georgia/.github/actions/test2@release-2.0.0"
# } # external action