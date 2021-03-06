FROM openjdk:12-alpine

ENV MEMORY 512M

ARG MINECRAFT_VERSION=1.14.3
ARG PAPER_VERSION=124

ADD https://papermc.io/api/v1/paper/$MINECRAFT_VERSION/$PAPER_VERSION/download /paper.jar

RUN mkdir /minecraft
WORKDIR /minecraft

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /minecraft

CMD java -Xmx$MEMORY -jar /paper.jar
