#!/bin/bash

# cache the value because the shell hook step will remove it
_CONDA_DEFAULT_ENV="hsf-india"

__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Restore our "indended" default env
conda activate "${_CONDA_DEFAULT_ENV}"

git clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-April2026

exec "$@"
