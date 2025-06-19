#!/bin/bash

# Build and run the EmailFlow Pro application

echo "Building EmailFlow Pro Docker image..."
docker build -t emailflow-pro .

echo "Stopping existing container if running..."
docker stop emailflow-pro-container 2>/dev/null || true
docker rm emailflow-pro-container 2>/dev/null || true

echo "Running EmailFlow Pro container..."
docker run -d \
  --name emailflow-pro-container \
  -p 8080:8080 \
  -e JAVA_OPTS="-Dmail.util.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider -Dmail.mime.StreamProvider.class=org.eclipse.angus.mail.util.DefaultStreamProvider" \
  emailflow-pro

echo "EmailFlow Pro is starting..."
echo "Access the application at: http://localhost:8080"
echo "Check logs with: docker logs -f emailflow-pro-container"