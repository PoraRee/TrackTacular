FROM nvidia/cuda:12.4.0-runtime-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    git \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Add conda to path
ENV PATH=/opt/conda/bin:$PATH

# Initialize conda for bash
RUN conda init bash && \
    conda config --set auto_activate_base false

# Create conda environment and install jupyterlab
RUN conda install -y -c conda-forge jupyterlab

RUN conda create -n tracktacular_rep  python=3.9.21 ipykernel ipywidgets

RUN conda run -n tracktacular_rep pip install --no-cache-dir torch==2.6.0 torchvision==0.21.0

RUN conda run -n tracktacular_rep pip install --no-cache-dir mmcv==2.2.0 -f https://download.openmmlab.com/mmcv/dist/cu124/torch2.6/index.html

COPY requirements_team.txt /requirements.txt

RUN conda run -n tracktacular_rep pip install --no-cache-dir -r /requirements.txt && \
    rm /requirements.txt

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Set working directory
WORKDIR /workspace

# Set a fixed token for JupyterLab
ENV JUPYTER_TOKEN=tracktacular_cuda

# Expose Jupyter port
EXPOSE 8888

# Set bash as default shell
SHELL ["/bin/bash", "-c"]

# Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]