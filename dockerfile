FROM openjdk:11-jre-slim-buster
WORKDIR /app
COPY --from=builder /app/target/DevOps_Project-1.0.jar /usr/local/lib/my-app.jar
EXPOSE 8080
USER root
ENTRYPOINT ["java","-jar","/usr/local/lib/my-app.jar"]
