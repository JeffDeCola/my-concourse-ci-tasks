#!/bin/bash
# ls-example set-pipeline.sh

fly -t ci set-pipeline -p ls-example -c pipeline.yml --load-vars-from ../../../../.credentials.yml
