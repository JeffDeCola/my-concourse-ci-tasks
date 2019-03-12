#!/bin/bash
# readme-github-pages destroy-pipeline.sh

fly -t ci destroy-pipeline --pipeline readme-github-pages
