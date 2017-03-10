# my-concourse-ci-tasks

[![Code Climate](https://codeclimate.com/github/JeffDeCola/my-concourse-ci-tasks/badges/gpa.svg)](https://codeclimate.com/github/JeffDeCola/my-concourse-ci-tasks)
[![Issue Count](https://codeclimate.com/github/JeffDeCola/my-concourse-ci-tasks/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/my-concourse-ci-tasks/issues)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)

`my-concourse-ci-tasks` _is a place to keep snippets and examples of Concourse CI tasks.

Concourse's main goal is to run tasks.

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)

## CONCOURSE TASKS

* [ls-example](https://github.com/JeffDeCola/my-concourse-ci-tasks/tree/master/ls-example)

   _Lists the files in a repo - a very simple bare bones example of using concourse._

* [readme-github-pages](https://github.com/JeffDeCola/my-concourse-ci-tasks/tree/master/readme-github-pages)

   _Takes your main README.md, edits and copies it to docs/_includes/README.md._

## TESTED USING CONCOURSE

A Concourse CI Pipeline will automate unit testing and update the GitHub WebPage.

![IMAGE - my-concourse-ci-tasks concourse ci piepline - IMAGE](docs/pics/my-concourse-ci-tasks-pipeline.jpg)

A _ci/.credentials.yml_ file needs to be created for your _slack_url_ and _repo_github_token_.

Use fly to upload the the pipeline file _ci/pipline.yml_ to Concourse:

```bash
fly -t ci set-pipeline -p my-concourse-ci-tasks -c ci/pipeline.yml --load-vars-from ci/.credentials.yml
```

## CONCOURSE RESOURCES IN PIPELINE

`my-concourse-ci-tasks` also contains a few extra concourse resources:

* A resource (_resource-slack-alert_) uses a [docker image](https://hub.docker.com/r/cfcommunity/slack-notification-resource)
  that will notify slack on your progress.
* A resource (_resource-repo-status_) use a [docker image](https://hub.docker.com/r/dpb587/github-status-resource)
  that will update your git status for that particular commit.

The above resources can be removed from the pipeline.
