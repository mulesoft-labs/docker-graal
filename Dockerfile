FROM ubuntu:16.04
MAINTAINER Leandro Shokida <leandroshokida@gmail.com>

ENV JAVA_HOME=/jre \
	PATH=${PATH}:/jre/bin \
	LANG=C.UTF-8

RUN cd /tmp && \
	apt-get update && \
	apt-get install -y --no-install-recommends bsdtar curl && \
	curl "http://s3.amazonaws.com/dataweave-playground/graalvm-0.30.2-linux-amd64-jdk8.tar.gz" | \
    bsdtar -xzf - && \
    mv graalvm-0.30.2/jre /jre && \
    rm /jre/bin/node && \
    rm /jre/bin/js && \
    rm /jre/bin/ruby && \
    rm /jre/bin/python && \
    rm -rf /jre/languages/R && \
    rm -rf /jre/languages/python && \
    rm -rf /jre/languages/ruby && \
    rm -rf /jre/languages/js && \
    rm -rf /tmp/*