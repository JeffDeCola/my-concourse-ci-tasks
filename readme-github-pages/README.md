# README-GITHUB-PAGES

Concourse's main goal is to run tasks. So lets do that.

`readme-github-pages` _takes your main README.md, edits and copies it to docs/_includes/README.md.._

[GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/)

[My notes on how to install Concourse CI](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/concourse-ci-cheat-sheet)

## FUNCTIONALITY

This task updates your GitHub webpage with the README.md from you main page.

This taks is updating this repos [GitHub Webpage](https://jeffdecola.github.io/my-concourse-ci-tasks/).

## TO CONFIGURE AND USE

1. Clone this Repo or create your own Repo and copy the files.

2. Update the `pipeline.yml` file to point to the proper directory in your
   Repo and where you store your `task-readme-github-pages.yml` file.

3. Create a `.credentials.yml` file to keep you github token and
   remember to update your `.gitignore` file.

4. Upload the `pipeline.yml` to your Concourse CI server.

   ```bash
   fly -t ci set-pipeline -p readme-github-pages -c ci/pipeline.yml --load-vars-from ci/.credentials.yml
   ```

5. Start the pipeline on your Concourse CI by pressing play.

## THE PIPELINE

Concourse CI shall look like,

![IMAGE - readme-github-pages concourse ci piepline - IMAGE](../docs/pics/readme-github-pages-pipeline.jpg)

Now everytime you commit to your Repo Concourse CI will run this task.
