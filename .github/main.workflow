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


## this works
# action "echo pr merged" {
#   uses = "taras/georgia/.github/actions/test2@release-2.0.0"
# }

# action "second action" {
#   uses = "taras/georgia/.github/actions/test@release-2.0.0"
#   needs = "echo pr merged"
# }
##
### what about variables?


action "echo pr merged" {
  uses = "docker://alpine"
  runs = "touch"
  args = ["hiya.txt"]
}

action "second action" {
  uses = "docker://alpine"
  needs = "echo pr merged"
  runs = "ls"
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