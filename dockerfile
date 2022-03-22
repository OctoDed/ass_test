FROM debian:11

MAINTAINER Laptev Pavel, gr. 738-1

COPY ./prog.cpp .
COPY ./assambler.s .

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install gcc-multilib -y
RUN apt-get install gdb -y

