# 0-baseline

This directory deploys the baseline resources for a GCP oranization supporting Consumer Edge. It does not deploy fleet
resources.

Due to this subdir being prepended with 0, it is deployed first by Google Cloud Build, presuming that it is a dependency
to all other deployments in this repository.
