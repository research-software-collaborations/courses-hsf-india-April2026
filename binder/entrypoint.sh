#!/bin/bash

# cache the value because the shell hook step will remove it
_CONDA_DEFAULT_ENV="hsf-india"

__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Restore our "indended" default env
conda activate "${_CONDA_DEFAULT_ENV}"

#lets try adding another kernel
cd /opt/conda/share/jupyter/kernels/ 
cp -r python3 dune_python 
sed -i  's/\/opt\/conda\/bin\/python/\/cvmfs\/larsoft.opensciencegrid.org\/products\/python\/v3_9_15\/Linux64bit+3.10-2.17\/bin\/python/' dune_python/kernel.json
sed -i 's/Python 3 (ipykernel)/Python 3 (Dune)/' kernel.json

git clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-April2026

exec "$@"
