FROM maven:3.8.3-openjdk-17 as build

COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

COPY --from=build /target/0.0.1-SNAPSHOT-teste.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]