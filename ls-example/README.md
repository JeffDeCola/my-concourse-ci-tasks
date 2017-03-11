# LS-EXAMPLE

Concourse's main goal is to run tasks.

`ls-example` _lists the files in a repo - a very simple bare bones example of
using concourse._

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)


## 1. ci/`pipeline.yml`

The `pipeline.yml` files pipelines jobs (tasks) together and the resources that each job need.

For this pipeline will shall contain:

* JOBS - ls-example
        * RESOURCE - git my-cheat-sheet
        * TASK - `ls-examples.sh`

```bash
???
```

## 2. ci/tasks/`task-ls-example.yml`

```bash
???
```

## 1. ci/scripts/`ls-example.sh`

```bash
#
```

NOTE: If in Windows, must change permissions to execute.

Open git for windows,

```bash
git update-index --chmod=+x search-and-replace.sh
```
