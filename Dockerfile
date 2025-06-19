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

# Expose port (Railway will set PORT environment variable)
EXPOSE $PORT

# Run the application with Railway's PORT
CMD ["sh", "-c", "java -Dserver.port=$PORT -jar target/TabSeven.jar"]