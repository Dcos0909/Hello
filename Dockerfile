# --------- Stage 1: Build the JAR using Maven ---------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies (cached)
COPY pom.xml .
COPY src ./src

# Build the JAR
RUN mvn clean package -DskipTests

# --------- Stage 2: Run the Spring Boot app ---------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
