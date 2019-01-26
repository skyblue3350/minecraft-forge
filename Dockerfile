FROM library/java:jre-alpine

RUN mkdir /mc
WORKDIR /mc
EXPOSE 25565

ENV VERSION=1.12.2-14.23.5.2808 \
    EXTRA_ARGS=nogui

# download forge
RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-installer.jar \
 && wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/${VERSION}/forge-${VERSION}-universal.jar \
 && echo "eula=true" > eula.txt \
 && java -jar forge-${VERSION}-installer.jar -installServer \
 && rm forge-${VERSION}-installer*

# exec server
CMD java -jar forge-${VERSION}-universal.jar ${EXTRA_ARGS}
