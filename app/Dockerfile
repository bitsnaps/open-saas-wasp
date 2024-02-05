# Use a specific Node.js base image that is compatible with Wasp
FROM node:18.12.0

# Install dependencies required for the installation script and running Wasp
RUN apt-get update && apt-get install -y curl

# Install Wasp CLI
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | sh

# Copy your application code into the Docker container
WORKDIR /app

COPY . .

# Expose the port Wasp uses by default
EXPOSE 3000

