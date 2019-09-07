FROM my_base:latest

WORKDIR /root/

RUN git clone https://github.com/zjpoh/pyjanitor.git

WORKDIR /root/pyjanitor/

ENV PATH /root/miniconda/bin:$PATH

RUN make install

WORKDIR /root/
