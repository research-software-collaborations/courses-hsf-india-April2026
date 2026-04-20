FROM nvcr.io/nvidia/nvhpc:25.5-devel-cuda12.9-ubuntu22.04

RUN apt-get update -y
RUN apt-get install -y git pip wget
RUN apt-get install -y curl rpm2cpio cpio

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

RUN pip install --no-cache numba awkward uproot matplotlib h5py hist
RUN pip install --no-cache cupy-cuda12x

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
ENV SHELL /bin/bash
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}



RUN ln=`grep -n "exec " /usr/local/bin/_entrypoint.sh | tail -1 | cut -f1 -d:`; \
    sed -i "${ln}igit clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-April2026" /usr/local/bin/_entrypoint.sh

## remove the news
COPY binder/overrides.json /tmp
RUN mkdir -p /opt/conda/share/jupyter/lab/settings; \
      cp /tmp/overrides.json /opt/conda/share/jupyter/lab/settings    

WORKDIR ${HOME}
USER ${USER}

RUN echo "export PS1='\[\e[0;32m\]\w\$\[\e[0m\] '" >> .bashrc
