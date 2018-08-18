FROM ubuntu:18.04

MAINTAINER Carlos Moro <cmoro@deusto.es>

ENV TOMCAT_VERSION 8.0.49

# Set locales
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common

# Install JDK 8
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer wget unzip tar && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Get Tomcat
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009

VOLUME "/usr/local/tomcat/webapps"
WORKDIR /usr/local/tomcat
EXPOSE 8080

# Launch Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
