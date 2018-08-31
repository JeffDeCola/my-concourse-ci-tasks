#!/bin/bash
# readme-github-pages update_concourse.sh

fly -t ci set-pipeline -p readme-github-pages -c ci/pipeline.yml --load-vars-from ../../.credentials.yml
