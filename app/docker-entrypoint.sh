#!/bin/sh

# Run database migrations
wasp db migrate-dev

# Optionally start the Wasp development server
# Note: You might want to handle starting the server differently depending on your setup
# For example, you could use CMD ["wasp", "start"] in the Dockerfile to start the server and omit from here

# Keep the container running if you're not starting the Wasp server directly
# This could be useful if you're using `docker-compose up` to manage services together
# tail -f /dev/null

# If you're directly starting Wasp's server and potentially Wasp DB studio,
# consider the implications on container lifecycle and logging
wasp build
wasp db studio
wasp start

# Execute the command provided to the docker run command, if any
exec "$@"
