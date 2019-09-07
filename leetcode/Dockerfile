FROM my_base:latest

# Pytest
RUN . /root/miniconda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda install -y -c conda-forge \
        python=3.7 \
        pytest \
        flake8 \
        pylint \
        black
