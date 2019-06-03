FROM openjdk:8-jre

ENV MEMORY 1536M

ARG MINECRAFT_VERSION=1.14.2
ARG PAPER_VERSION=65

ADD https://papermc.io/api/v1/paper/$MINECRAFT_VERSION/$PAPER_VERSION/download /paper.jar

RUN mkdir /minecraft
WORKDIR /minecraft

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /minecraft

CMD java -Xms$MEMORY -Xmx$MEMORY -jar /paper.jar
