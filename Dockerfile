FROM openjdk:8-jre

ENV MEMORY 512M

ARG MINECRAFT_VERSION=1.14.2
ARG PAPER_VERSION=53

ADD https://papermc.io/api/v1/paper/$MINECRAFT_VERSION/$PAPER_VERSION/download /paper.jar

RUN mkdir /minecraft
WORKDIR /minecraft

EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /minecraft

CMD java -Xms$MEMORY -Xmx$MEMORY -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar /paper.jar
