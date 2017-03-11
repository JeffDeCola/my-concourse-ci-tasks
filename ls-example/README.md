# LS-EXAMPLE

Concourse's main goal is to run tasks.

`ls-example` _lists the files in a repo - a very simple bare bones example of
using concourse._

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)

## THE PIPELINE

This `pipeline.yml` shall contain:

* RESOURCE (git)
* JOB (job-ls-example)

And the JOB shall contain the task configuration and
the bash script to perform the task.

NOTE: The pipeline uses the task-ls-example.yml file to config the task.

![IMAGE - concourse ci ls-example - IMAGE](https://github.com/JeffDeCola/my-cheat-sheets/blob/master/docs/pics/Concourse-structure.jpg)
