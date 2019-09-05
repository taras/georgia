#~~~~~~~~~ Workflows ~~~~~~~~~#

workflow "PR Created" {
  on = "pull_request"
  resolves = ["Danger"]
}

workflow "PR Merged" {
  on = "push"
  resolves = ["Merge Action"]
}



#~~~~~~~~~ Actions ~~~~~~~~~#

action "Danger" {
  uses = "taras/georgia/.github/actions/Danger@release-2.0.0"
  args = ["GITHUB_TOKEN = $DANGER_GITHUB"]
  secrets = ["DANGER_GITHUB"]
}

action "Merge Action" {
  needs = ["Release Branch Filter"]
  uses = "taras/georgia/.github/actions/Echos@release-2.0.0"
  args = ["whawhawha"]
}

action "Release Branch Filter" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "branch release-*"
}


#~~~~~~~~~ Examples ~~~~~~~~~#

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