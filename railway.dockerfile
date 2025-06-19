# Railway-specific Dockerfile
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven curl && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Set Jakarta Mail system properties
ENV JAVA_OPTS="-Dmail.util.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider -Dmail.mime.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider"

# Expose port (Railway will set PORT environment variable)
EXPOSE $PORT

# Run the application with Railway's PORT
CMD ["sh", "-c", "java $JAVA_OPTS -Dserver.port=$PORT -jar target/TabSeven.jar"]