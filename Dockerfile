FROM maven:3.9 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM amazoncorretto:17-alpine
MAINTAINER LeninQuintero
COPY --from=builder /app/target/spring-boot-mysql-demo-0.0.1-SNAPSHOT.jar /usr/local/lib/spring-boot-mysql-demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/spring-boot-mysql-demo-0.0.1-SNAPSHOT.jar"]
