# iac-deploy
This repo deploys an environment supporting a Consumer Edge environment containing fleet(s) of clusters and its supporting organization resources, using modules pulled from external repositories.

This repo is deployed using Google Cloud Build.  Each subdirectory in this repo corresponds to an independently deployable set of Terraform resources.  

Cloud Build loops through subdirectories inferring deployment order alphabetically, hence prepending each folder with a number corresponding to its sequence.
