#!/bin/bash

docker run --rm kaczmarj/neurodocker:master generate docker\
           --base neurodebian:stretch-non-free \
           --pkg-manager apt \
           --install tree \
                     git-annex-standalone vim emacs-nox nano less ncdu \
                     tig git-annex-remote-rclone \
           --user=neuro \
           --miniconda miniconda_version="4.3.31" \
             conda_install="python=3.6 jupyter jupyter_contrib_nbextensions
                            nbformat nibabel" \
             pip_install="datalad[full]" \
             create_env="neuro" \
             activate=True \
           --run-bash "source activate neuro && jupyter nbextension enable exercise2/main && jupyter nbextension enable spellchecker/main" \
           --user=neuro \
           --run-bash 'source activate neuro' \
           --run 'mkdir -p ~/.jupyter && echo c.NotebookApp.ip = \"0.0.0.0\" > ~/.jupyter/jupyter_notebook_config.py' \
           --workdir /home/neuro > Dockerfile
