FROM ubuntu:trusty
MAINTAINER Andrew Malitski <andrew-writer@mail.ru>

#Usage version phantomjs
ENV PHANTOM_JS_VERSION 2.1.1

#Install requirements http://phantomjs.org/build
RUN apt-get update -qq && apt-get install -y -qq \
        git build-essential g++ flex bison gperf ruby perl \
        libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
        libpng-dev libjpeg-dev python libx11-dev libxext-dev
RUN git clone https://github.com/ariya/phantomjs.git /tmp/phantomjs && cd /tmp/phantomjs && \
        git checkout $PHANTOM_JS_VERSION && git submodule init && git submodule update
RUN cd /tmp/phantomjs && python build.py && mv bin/phantomjs /usr/local/bin && rm -rf /tmp/phantomjs

EXPOSE 8910
CMD ["phantomjs", "--webdriver=8910"]