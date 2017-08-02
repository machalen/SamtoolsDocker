#############################################
#RNA-seq Tools
#Dockerfile to use Samtools v1.5
#Ubuntu 14.04
#############################################
#Build the image based on Ubuntu
FROM ubuntu:14.04

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

#Update and install packages wget, unzip and python
RUN apt-get update -y && apt-get install -y \
wget git unzip bzip2 g++ make zlib1g-dev ncurses-dev python default-jdk default-jre libncurses5-dev \
libbz2-dev liblzma-dev

ENV SAMTOOLS_INSTALL_DIR=/opt/samtools
#Set the working directory
WORKDIR /tmp

#Download Samtools from GitHub
RUN wget http://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2

#Unbzip and untar the package
RUN tar --bzip2 -xf samtools-1.5.tar.bz2
WORKDIR /tmp/samtools-1.5
RUN ./configure  --prefix=$SAMTOOLS_INSTALL_DIR
RUN make
RUN install
RUN rm /tmp/samtools-1.5.tar.bz2

#Set WorkingDir and Add samtools to the path variable
WORKDIR /
