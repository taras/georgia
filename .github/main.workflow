workflow "on pushkin" {
  on = "push"
  resolves = ["echoer"]
}

action "echoer" {
  uses = "docker://alpine"
  runs = "echo hello"
  #args = ["Hello", "yah"]
}