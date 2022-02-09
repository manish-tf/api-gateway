FROM maven:3-openjdk-8 as build

WORKDIR /workspace

COPY pom.xml .
COPY src src

RUN mvn package -DskipTests

FROM adoptopenjdk/openjdk8:alpine-jre
ARG JAR_FILE=/workspace/target/*.jar
COPY --from=build ${JAR_FILE} /opt/service.jar

RUN apk update && apk upgrade
RUN apk add --update tzdata
ENV TZ=Asia/Kolkata

EXPOSE 3333

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/service.jar"]