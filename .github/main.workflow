#~~~~~~~~~ Workflows ~~~~~~~~~#

workflow "PR Created" {
  on = "pull_request"
  resolves = ["Danger"]
}

workflow "PR Merged" {
  on = "push"
  resolves = ["Echos"]
}



#~~~~~~~~~ Actions ~~~~~~~~~#

action "Danger" {
  uses = "taras/georgia/.github/actions/Danger@release-2.0.0"
  args = [""]
  env = [GITHUB_TOKEN = "${{ secrets.DANGER_GITHUB }}"]
  secrets = ["DANGER_GITHUB"]
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