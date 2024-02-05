# Use a Node.js base image
FROM node:latest

# Install curl
RUN apt-get update && apt-get install -y curl

# Run the Wasp installer
RUN curl -sSL https://get.wasp-lang.dev/installer.sh | sh

# Run database migration
# Note: This is a setup command and might not be suitable to run in Dockerfile. Consider moving to an entrypoint script if it requires running environment
RUN wasp db migrate-dev
RUN wasp start
RUN wasp db studio

# Expose the port wasp uses
EXPOSE 3000
