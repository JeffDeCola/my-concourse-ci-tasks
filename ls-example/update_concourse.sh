#!/bin/bash
# ls-example update_concourse.sh

fly -t ci set-pipeline -p ls-example -c ci/pipeline.yml --load-vars-from ../../.credentials.yml
