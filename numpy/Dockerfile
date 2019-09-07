FROM my_base:latest

WORKDIR /root/

RUN git clone https://github.com/zjpoh/numpy.git

WORKDIR /root/numpy/

ENV PATH /root/miniconda/bin:$PATH

RUN . /root/miniconda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda update -n base -c defaults conda && \
    conda install -y cython pytest pytest-cov

WORKDIR /root/numpy/
