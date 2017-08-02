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
RUN apt-get update && apt-get install --yes wget unzip python

#Set the working directory
WORKDIR /bin

#Download Samtools from GitHub
RUN wget http://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2

#Unbzip and untar the package
RUN tar jxf samtools-1.5.tar.bz2
RUN rm samtools-1.5.tar.bz2
WORKDIR /bin/samtools-1.5
RUN ./configure
RUN make

#Set WorkingDir and Add samtools to the path variable
WORKDIR /
ENV PATH $PATH:/bin/samtools-1.5
