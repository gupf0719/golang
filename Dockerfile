#Install Go
FROM ubuntu

#env
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install curl libcurl3 libcurl3-dev php5-curl git binutils bison gcc make

#gvm
RUN curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer > /root/gvm-installer && \
    bash < /root/gvm-installer

#go1.5.2
RUN bash -c "source /root/.gvm/scripts/gvm;gvm install go1.4;gvm use go1.4;gvm install go1.5.2;gvm use go1.5.2 --default"

#glang env
ENV GOROOT /usr/lib/go
ENV GOPATH /usr/local/go
ENV GOBIN $GOPATH/bin
ENV PATH $GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin"
WORKDIR $GOPATH
