FROM nvcr.io/nvidia/nvhpc:26.3-devel-cuda13.1-ubuntu22.04
#moving to ubuntu 24.xx requires a different way of installing python packages...
#To install Python packages system-wide, try apt install
#python3-xyz, where xyz is the package you are trying to
#install.
#I have not tried this

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



RUN ln=`grep -n "exec " /usr/local/bin/entrypoint.sh | tail -1 | cut -f1 -d:`; \
    sed -i "${ln}igit clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-April2026" /usr/local/bin/entrypoint.sh
RUN ln=`grep -n "exec " /usr/local/bin/entrypoint.sh | tail -1 | cut -f1 -d:`; \
    sed -i "${ln}igit clone --recurse-submodules https://github.com/research-software-collaborations/courses-hsf-india-May2026" /usr/local/bin/entrypoint.sh
## remove the news
COPY binder/overrides.json /tmp
RUN mkdir -p /opt/conda/share/jupyter/lab/settings; \
      cp /tmp/overrides.json /opt/conda/share/jupyter/lab/settings    

WORKDIR ${HOME}
USER ${USER}

RUN echo "export PS1='\[\e[0;32m\]\w\$\[\e[0m\] '" >> .bashrc
