#!/bin/bash
# my-concourse-ci-tasks update_concourse.sh

fly -t ci set-pipeline -p my-concourse-ci-tasks -c ci/pipeline.yml --load-vars-from ci/.credentials.yml
