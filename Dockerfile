FROM debian:latest as builder

RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    gcc \
    make \
    pkg-config \
    libpcre3-dev \
    zlib1g-dev \
    liblzma-dev \
    libssl-dev \
    git

RUN git clone https://github.com/ggreer/the_silver_searcher.git

WORKDIR /the_silver_searcher

RUN ./autogen.sh

RUN ./configure LDFLAGS="-static"
RUN make

FROM scratch

COPY --from=builder /the_silver_searcher/ag /ag

ENTRYPOINT ["/ag"]

