# LS-EXAMPLE

Concourse's main goal is to run tasks. So lets do that.

`ls-example` _lists the files in a repo - a very simple bare bones example of
using concourse._

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)
[My notes on how to install Concourse CI](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/concourse-ci-cheat-sheet)

## FUNCTIONALITY

The purpose of this example is to give you a bare bones example
on how to use Concourse CI.

This example will grab a repo from github and list (`ls -Rlat`) the contents
of that Repo on your Concourse CI server.

It is assumed you already have a Concourse CI server running.

## THE PIPELINE

The `pipeline.yml` file contains:

* RESOURCE (git) - This gets your repo.
* JOB (job-ls-example) - This runs the task.

The JOB contains the task configuration (`task-ls-example.yml`) and
the bash script (`ls-example.sh`) to perform the task (`ls -Rlat`).

This picture may help better illustrate how everything fits together.

![IMAGE - concourse ci ls-example - IMAGE](https://github.com/JeffDeCola/my-cheat-sheets/blob/master/docs/pics/Concourse-structure.jpg)

## TO CONFIGURE AND USE

1. Clone this Repo or create your own Repo and copy the files.

2. Update the `pipeline.yml` file to point to the proper directory in your
   Repo and where you store your `task-ls.example.yml` file.

3. Create a `.credentials.yml` file to keep you github token and
   remember to update your `.gitignore` file.

4. Upload the `pipeline.yml` to your Concourse CI server.

   ```bash
   fly -t ci set-pipeline -p ls-example -c ci/pipeline.yml --load-vars-from ci/.credentials.yml
   ```

5. Start the pipeline on your Concourse CI by pressing play.

Now everytime you commit to your Repo Concourse CI will run this task.

You may view the results of the task (`ls -Rlat`) on your
Concourse CI server.
