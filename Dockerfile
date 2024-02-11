FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y g++ gcc make qtbase5-dev libqt5svg5-dev\
        qttools5-dev qtchooser qttools5-dev-tools libmuparser-dev librsvg2-bin\
        libboost-dev libfreetype6-dev libicu-dev pkg-config

COPY . /work
WORKDIR /work
RUN qmake -qt=5 -r && make -j4
ENTRYPOINT ["./unix/librecad", "dxf2png"]