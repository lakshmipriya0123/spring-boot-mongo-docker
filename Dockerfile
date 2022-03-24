FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh
RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app
ENV testvariable=lakshmi
ENV appVersion=2.8
CMD echo "Testing liquibase $testvariable"
CMD echo "Testing liquibases $appVersion"
COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./spring-boot-mongo.jar"]
