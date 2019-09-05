workflow "on pushkin" {
  on = "push"
  resolves = ["echoer"]
}

# action "echoer" {
#   uses = "docker://alpine"
#   runs = "echo"
#   #args = ["Hello", "yah"]
#   args = "hello"
# }

# action "echoer" {
#   uses = "./.github/actions/test"
# } this works


action "echoer" {
  uses = "taras/georgia/.github/actions/test@release-2.0.0"
}