ARG ubuntuversion
ARG tomcatmajor
ARG tomcatversion
FROM ubuntu:ubuntuversion
 
MAINTAINER Devendra Prasad

ENV TOMCAT_VERSION ${tomcatversion}
RUN echo ${ubuntuversion}
