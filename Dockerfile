FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh
RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app
ENV variable rollbackupdate
COPY docker-entry.sh .
RUN chmod +x docker-entry.sh .
ENTRYPOINT ["/docker-entry.sh"]

COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
