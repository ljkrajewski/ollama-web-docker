FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
ARG BASEDIR=/usr/src

# Install updates and Ollama binary.
WORKDIR $BASEDIR
RUN apt update && \
    apt upgrade -y && \
    apt install git curl wget python3 python3-pip -y && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    curl -fsSL https://ollama.com/install.sh | sh

# Install open-webui
RUN pip install open-webui && \
    open-webui serve

