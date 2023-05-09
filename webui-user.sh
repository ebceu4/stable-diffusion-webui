#!/bin/bash
#########################################################
# Uncomment and change the variables below to your need:#
#########################################################

git pull

# Install directory without trailing slash
install_dir="/workspace"
model_dir="/workspace/stable-diffusion-webui/models/Stable-diffusion/"

model_file=$(find "$model_dir" -type f \( -name "*.safetensors" -o -name "*.ckpt" \) ! -name "SDv*" | head -n 1)

# source watch_and_upload.sh /workspace/stable-diffusion-webui/outputs/img2img-images &
# python3 ./custom/main.py &

# Name of the subdirectory
#clone_dir="stable-diffusion-webui"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
if [ -z "$model_file" ]; then
    echo "No .safetensors or .ckpt file found in $model_dir"
    exit 1
fi

# Set the COMMANDLINE_ARGS variable with the found model file
export COMMANDLINE_ARGS="--port 3000 --api --xformers --ckpt $model_file --listen --enable-insecure-extension-access"
#export COMMANDLINE_ARGS="--port 3000 --xformers --listen --enable-insecure-extension-access"

# python3 executable
#python_cmd="python3"

# git executable
#export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
#venv_dir="venv"

# script to launch to start the app
#export LAUNCH_SCRIPT="launch.py"

# install command for torch
#export TORCH_COMMAND="pip install torch==1.12.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113"

# Requirements file to use for stable-diffusion-webui
#export REQS_FILE="requirements_versions.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export TAMING_TRANSFORMERS_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

###########################################
