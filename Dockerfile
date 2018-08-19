ARG ubuntuversion
ARG tomcatmajor
ARG tomcatversion
FROM ubuntu:$ubuntuversion
RUN echo $ubuntuversion
