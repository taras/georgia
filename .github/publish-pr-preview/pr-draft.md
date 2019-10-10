# Motivation
Currently, Github does not provide a way to upload workflows to be reusable in multiple projects; the workflows must be manually configured for each project.

The `publish-pr-preview` action is being proposed to refactor and combine `write-npm-snapshot-version`, `npm-publish-branch-preview`, and `post-npm-usage-instructions-comment` actions.

This will allow us to maintain/modify the aciton (essentially the whole workflow in this use case) from the source of the action as to avoid having to go into each project to edit their workflows.

*The trade off to this approach is listed in the TODOs below.*

# Approach
The functionality of this action is very simple:
- Check for accessibility to NPM token in secrets
- Make sure this action is being run from a pull request.
- Make sure the name of the head branch of the pull request isn't `latest` to avoid conflicts with NPM tagging.
- Update package version with snapshot, publish to NPM with branch name as tag.
- Comment on pull request with instructions on how to use access the package.

# TODOs


# Learning
