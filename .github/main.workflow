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
# } this works


action "first action" {
  uses = "taras/georgia/.github/actions/test@release-2.0.0"
}

action "second action" {
  needs = ["first action"]
  uses = "taras/georgia/.github/actions/test2@release-2.0.0"
}