FROM debian:11

MAINTAINER Laptev

COPY ./cpp_prog.cpp .
COPY ./test.s .

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install gcc-multilib -y
RUN apt-get install gdb -y

