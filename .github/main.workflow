workflow "on pushkin" {
  on = "push"
  resolves = ["last action"]
}

# action "echoer" {
#   uses = "docker://alpine"
#   runs = "echo"
#   args = "hello"
# }

# action "echoer" {
#   uses = "./.github/actions/test"
# } this works


action "last action" {
  uses = "docker://alpine"
  needs = "first action"
  runs = "echo $yeah"
}

action "first action" {
  uses = "taras/georgia/.github/actions/test@release-2.0.0"
}