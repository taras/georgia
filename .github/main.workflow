workflow "on pushkin" {
  on = "push"
  resolves = ["echoer"]
}

action "echoer" {
  uses = "docker://alpine"
  run = "echo"
  args = ["Hello", "World"]
}