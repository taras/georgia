workflow "Yeah Georgia" {
  on = "push"
  resolves = ["loggy"]
}

action "masters" {
  uses = "actions/bin/filter@25b7b846d5027eac3315b50a8055ea675e2abd89"
  args = "branch master"
}

action "loggy" {
  needs = "masters"
  uses = "./.github/testecho.sh"
}
