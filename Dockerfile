# Use OpenJDK 17 with Alpine Linux for smaller image size
FROM openjdk:17-jdk-alpine

# Set working directory
WORKDIR /app

# Install required packages
RUN apk add --no-cache curl

# Copy Maven wrapper and pom.xml first for better caching
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Make Maven wrapper executable
RUN chmod +x ./mvnw

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Set Jakarta Mail system properties as environment variables
ENV JAVA_OPTS="-Dmail.util.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider -Dmail.mime.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider"

# Expose port
EXPOSE 8080

# Run the application
CMD ["sh", "-c", "java $JAVA_OPTS -jar target/TabSeven.jar"]