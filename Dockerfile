FROM openjdk:8-jdk-alpine as build

WORKDIR /workspace

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN chmod +x ./mvnw
RUN ./mvnw package -DskipTests

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/workspace/target/*.jar
COPY --from=build ${JAR_FILE} /opt/service.jar

RUN apk update && apk upgrade
RUN apk add --update tzdata
ENV TZ=Asia/Kolkata

EXPOSE 3333

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/service.jar"]