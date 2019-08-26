workflow "Yeah Georgia" {
  on = "push"
  resolves = ["echos"]
}

action "masters" {
  uses = "actions/bin/filter@25b7b846d5027eac3315b50a8055ea675e2abd89"
  args = "branch master"
}

action "echos" {
  needs = "masters"
  uses = ".github/actions/test"
}