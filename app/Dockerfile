# Use a Node.js base image
FROM node:latest

# Install curl
RUN apt-get update && apt-get install -y curl

# Create a directory for your app
WORKDIR /app

# Copy your application code to the Docker image
COPY . /app

# Run the Wasp installer
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | sh

# Assuming the Wasp CLI is installed globally, and your Wasp project is in the current directory
# Note: The original command sequence might need adjustments for Docker
# Specifically, `wasp db studio` and `wasp start` start servers, which should be handled differently in Docker

# Run database migration
# Note: This is a setup command and might not be suitable to run in Dockerfile. Consider moving to an entrypoint script if it requires running environment
RUN wasp db migrate-dev

# The `wasp db studio` and `wasp start` commands are intended to run services.
# These should not be run during the build but as part of the container startup.
# Therefore, we'll use an entrypoint script to manage these commands.

# Create an entrypoint script
RUN echo '#!/bin/sh\n\
wasp db studio &\n\
wasp start\n' > /entrypoint.sh && chmod +x /entrypoint.sh

# Set the entrypoint script to run when the container starts
ENTRYPOINT ["/entrypoint.sh"]

# Expose the port wasp uses
EXPOSE 3000
