#~~~~~~~~~ Workflows ~~~~~~~~~#

workflow "PR Created" {
  on = "pull_request"
  resolves = ["Echos"]
}

workflow "PR Merged" {
  on = "push"
  resolves = ["Danger"]
}



#~~~~~~~~~ Actions ~~~~~~~~~#

action "Danger" {
  uses = "taras/georgia/.github/actions/Danger@release-2.0.0"
  needs = ["Echos"]
  args = ["testingargs"]
}

action "Echos" {
  uses = "taras/georgia/.github/actions/Echos@release-2.0.0"
  args = ["whawhawha"]
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