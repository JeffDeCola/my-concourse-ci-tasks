#!/bin/bash
# readme-github-pages set-pipeline.sh

fly -t ci set-pipeline -p readme-github-pages -c pipeline.yml --load-vars-from ../../../../.credentials.yml
