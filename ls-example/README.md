# LS-EXAMPLE

`ls-example` _lists the files in a repo - a very simple bare bones example of
using concourse._

Concourse's main goal is to run tasks.

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)

## 1. scripts/search_and_replace.sh

```bash
#!/bin/bash
# my-go-examples searchadsfasdf.sh

ls -lat
```
NOTE: If in windows, must change permissions to execute.

Open git for windows,

```bash
git update-index --chmod=+x search-and-replace.sh
```

## 2. tasks/task-search-and-replace.yml

```bash
# my-go-examples task-readme-github-pages.yml

platform: linux

image_resource:
  type: docker-image
  source:
    repository: golang
    tag: 1.7.1

inputs:
- name: my-go-examples

outputs:
- name: my-go-examples-updated

run:
path: ./my-go-examples/ci/scripts/readme-github-pages.sh
```

## 3. pipeline.yml

```bash
# my-go-examples pipeline.yml

jobs:

- name: job-readme-github-pages
  plan:
  - get: my-go-examples
    trigger: true
  - task: task-readme-github-pages
    file: my-go-examples/ci/tasks/task-readme-github-pages.yml
  - put: my-go-examples
    params:
      repository: my-go-examples-updated

- name: job-unit-tests
  plan:
  - get: my-go-examples
    trigger: true
  - put: resource-slack-alert
    params:
      channel: '#jeff-builds'
      text: "From my-go-examples: STARTED job-unit-tests in concourse ci."
  - put: resource-repo-status
    params: { state: "pending", description: "STARTED job-unit-tests in concourse ci.", commit: "my-go-examples" }
  - task: task-unit-tests
    file: my-go-examples/ci/tasks/task-unit-tests.yml
    on_success:
      do:
      - put: my-go-examples
        params:
          repository: my-go-examples  
      - put: resource-slack-alert
        params:
          channel: '#jeff-builds'
          text_file: coverage-results/test_coverage.txt
          text: |
            From my-go-examples: PASSED job-unit-tests in concourse ci. 
            $TEXT_FILE_CONTENT
      - put: resource-repo-status
        params: { state: "success", description: "PASSED job-unit-tests in concourse ci", commit: "my-go-examples" }
    on_failure:
      do:
      - put: resource-slack-alert
        params:
          channel: '#jeff-builds'
          text: "From my-go-examples: FAILED job-unit-tests in concourse ci."
      - put: resource-repo-status
        params: { state: "failure", description: "FAILED job-unit-tests in concourse ci.", commit: "my-go-examples" }

resource_types:

- name: slack-notification
  type: docker-image
  source:
    repository: cfcommunity/slack-notification-resource
    tag: latest
- name: github-status
  type: docker-image
  source:
    repository: dpb587/github-status-resource
    tag: master

resources:

- name: my-go-examples
  type: git
  source:
    #uri: https://github.com/jeffdecola/my-go-examples
    uri: git@github.com:jeffdecola/my-go-examples.git
    branch: master
    private_key: {{git_private_key}}
- name: resource-slack-alert
  type: slack-notification
  source:
    url: {{slack_url}} 
- name: resource-repo-status 
  type: github-status
  source:
    repository: jeffdecola/my-go-examples 
access_token: {{repo_github_token}}

```

Now upload the pipeline to concourse,

```bash
fly -t ci set-pipeline -p search-and-replace -c ci/pipeline.yml --load-vars-from ci/.credentials.yml
```
