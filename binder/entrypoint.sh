#!/bin/bash

# cache the value because the shell hook step will remove it
_CONDA_DEFAULT_ENV="hsf-india"

__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Restore our "indended" default env
conda activate "${_CONDA_DEFAULT_ENV}"

#lets try adding another kernel
source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup dunesw v10_13_00d00 -q e26:prof
python -m ipykernel install --name py-dune

conda activate "${_CONDA_DEFAULT_ENV}"

git clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-April2026

exec "$@"
