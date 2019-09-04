workflow "on pushkin" {
  on = "push"
  resolves = ["echoer"]
}

action "echoer" {
  uses = "docker://alpine"
  args = ["echo Hello"]
}