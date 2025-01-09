FROM postgres:16

RUN apt-get update && apt-get install -y \
    git \
    make \
    gcc \
    build-essential \
    python3 \
    python3-pip \
    postgresql-server-dev-16 \
    postgresql-plpython3-16 \
 && rm -rf /var/lib/apt/lists/*

#install pg-vector library
RUN git clone --branch v0.8.0 https://github.com/pgvector/pgvector.git /tmp/pgvector
RUN cd /tmp/pgvector && make
RUN cd /tmp/pgvector && make install

#install pgai library
ENV PG_BIN /usr/lib/postgresql/16/bin
RUN git clone https://github.com/timescale/pgai.git --branch extension-0.6.0 /tmp/pgai
RUN /tmp/pgai/projects/extension/build.py install
