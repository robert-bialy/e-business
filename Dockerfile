FROM ubuntu:16.04

ENV JAVA_HOME /usr/lib/jvm/jdk8

ENV PATH $PATH:$JAVA_HOME/bin

RUN apt update && apt upgrade -y

RUN apt install -y openjdk-8-jre-headless wget curl binutils apt-transport-https ca-certificates

RUN wget http://scala-lang.org/files/archive/scala-2.12.1.deb

RUN dpkg -i scala-2.12.1.deb

RUN apt update && apt install scala nodejs npm -y

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list

RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add

RUN apt update -y

RUN apt install sbt -y