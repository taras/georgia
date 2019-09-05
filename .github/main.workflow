workflow "on pushkin" {
  on = "push"
  resolves = ["second action"]
}

# action "echoer" {
#   uses = "docker://alpine"
#   runs = "echo"
#   args = "hello"
# }

# action "echoer" {
#   uses = "./.github/actions/test"
# }


action "first action" {
  uses = "./.github/actions/test"
}

action "second action" {
  needs = ["first action"]
  uses = "taras/georgia/.github/actions/test2@release-2.0.0"
}