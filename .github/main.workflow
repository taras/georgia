workflow "on pushkin" {
  on = "push"
  resolves = ["echoer"]
}

action "echoer" {
  uses = "docker://alpine"
  runs = "hello=dingdong; echo $hello"
  #args = ["Hello", "yah"]
}