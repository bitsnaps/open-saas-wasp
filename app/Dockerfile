# Use a specific Node.js base image that is compatible with Wasp
FROM node:18.12.0

# Install dependencies required for the installation script and running Wasp
RUN apt-get update && apt-get install -y curl

# Install Wasp CLI
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | sh

# Add Wasp and local bin to PATH for this Dockerfile and runtime
ENV PATH="/root/.local/bin:${PATH}"

# Copy your application code into the Docker container
WORKDIR /app
COPY . .

# Expose the port Wasp uses by default
EXPOSE 3000

# Use an entrypoint script to handle initialization and starting of the Wasp project
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Default command to run when starting the container
CMD ["wasp", "start"]
