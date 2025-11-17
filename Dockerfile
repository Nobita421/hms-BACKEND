# ---------- Build stage ----------
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Produce the runnable Spring Boot fat jar
RUN mvn -B -DskipTests clean package

# ---------- Run stage ----------
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Activate the in-memory H2 profile for stateless test deployments
ENV SPRING_PROFILES_ACTIVE=test
ENV JAVA_OPTS=""

COPY --from=build /app/target/hospital.jar app.jar

EXPOSE 8081
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
