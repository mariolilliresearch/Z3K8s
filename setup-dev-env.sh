#!/bin/bash

# Update and install essential packages
apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    build-essential \
    wget \
    unzip \
    libgmp-dev \
    vim

# Install Z3 Theorem Prover
wget https://github.com/Z3Prover/z3/releases/download/z3-4.11.2/z3-4.11.2-x64-glibc-2.31.zip \
    && unzip z3-4.11.2-x64-glibc-2.31.zip -d /usr/local/ \
    && mv /usr/local/z3-* /usr/local/z3 \
    && ln -s /usr/local/z3/bin/z3 /usr/local/bin/z3 \
    && rm z3-4.11.2-x64-glibc-2.31.zip

# Install NuSMV
wget http://nusmv.fbk.eu/distrib/NuSMV-2.6.0-Linux.tar.gz \
    && tar -xvf NuSMV-2.6.0-Linux.tar.gz -C /usr/local/ \
    && mv /usr/local/NuSMV-* /usr/local/NuSMV \
    && ln -s /usr/local/NuSMV/bin/NuSMV /usr/local/bin/NuSMV \
    && rm NuSMV-2.6.0-Linux.tar.gz

# Install Python libraries
pip3 install --no-cache-dir \
    kubernetes \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    tensorflow \
    z3-solver

# Clean up
apt-get clean && rm -rf /var/lib/apt/lists/*
