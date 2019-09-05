workflow "PR Created" {
  on = "pull_request"
  resolves = ["echo pr created"]
}

workflow "PR Merged" {
  on = "push"
  resolves = ["echo pr merged", "second action"]
}

action "echo pr created" {
  uses = "docker://alpine"
  runs = "echo"
  args = ["pr", "created"]
}

action "echo pr merged" {
  uses = "docker://alpine"
  runs = "echo"
  args = ["pr > test.txt"]
}

action "second action" {
  uses = "docker://alpine"
  runs = "ls"
}


# action "echoer" {
#   uses = "docker://alpine"
#   runs = "echo"
#   args = "hello"
# } # docker instead of action in uses

# action "echoer" {
#   uses = "./.github/actions/test"
# } # local action

# action "second action" {
#   needs = ["first action"]
#   uses = "taras/georgia/.github/actions/test2@release-2.0.0"
# } # external action