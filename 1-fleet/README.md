# 1-fleet

This subdirectory contains resources for deploying the resources required by a fleet. It is prepended with a `1`, and
will deploy after subdirs prepended with a `0`. This deployment depends on the `0-baseline` deployment of resources as
it uses `terraform_remote_state` to access outputs of `0-baseline` deployment.
