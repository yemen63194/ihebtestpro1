# Maven
FROM maven:3.6.3-openjdk-17-slim AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn clean -e -B package
FROM openjdk:17-jre-slim-buster
WORKDIR /app
COPY --from=builder /app/target/DevOps_Project-1.0.jar .
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/target/DevOps_Project-1.0.jar"]
