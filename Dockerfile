FROM library/java:jre-alpine

RUN mkdir /mc
WORKDIR /mc
EXPOSE 25565

ENV VERSION=1.16.4-35.1.28 \
    EXTRA_ARGS=nogui

# download forge
RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar \
 && echo "eula=true" > eula.txt \
 && java -jar forge-${VERSION}-installer.jar -installServer \
 && rm forge-${VERSION}-installer*

# exec server
CMD java -jar forge-${VERSION}.jar ${EXTRA_ARGS}
