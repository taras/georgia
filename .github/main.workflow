workflow "Yeah Georgia" {
  on = "push"
  resolves = ["masters"]
}

action "masters" {
  uses = "actions/bin/filter@25b7b846d5027eac3315b50a8055ea675e2abd89"
  args = "branch master"
}

