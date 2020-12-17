FROM ubuntu:18.04

# Install python and other runtime dependencies
RUN apt-get update && \
    apt-get -y install \
        build-essential \
        libatlas-base-dev \
        git \
        wget \
        curl \
        nginx \
        jq

# Install miniconda
RUN echo 'installing miniconda' && \
    curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -bfp /miniconda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH=/miniconda3/bin:${PATH}

RUN conda update -y conda

# Python won’t try to write .pyc or .pyo files on the import of source modules
# Force stdin, stdout and stderr to be totally unbuffered. Good for logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING='utf-8'
