FROM ubuntu:latest

RUN apt update && \
    apt install -y \
        wget \
        git \
        curl \
        cmake \
        build-essential \
        vim \
        openjdk-8-jre-headless

WORKDIR /root/

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O miniconda.sh && \
    bash miniconda.sh -b -p miniconda && \
    echo ". /root/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo export PATH="$HOME/miniconda/bin:$PATH" >> .bashrc && \
    rm miniconda.sh

# My RCs
RUN git clone https://github.com/zjpoh/myrc && \
    cp myrc/condarc .condarc && \
    cp myrc/vimrc .vimrc && \
    cp myrc/inputrc .inputrc

# vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    vim +'PlugInstall --sync' +qa && \
    echo export export TERM=xterm-256color >> .bashrc
