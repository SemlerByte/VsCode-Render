# Use an official Alpine Linux runtime as a parent image
FROM alpine:latest

# Set the working directory to /app
WORKDIR /app

# Copy only the necessary files into the container at /app
COPY . /app

# Install required tools (example with apk package manager)
RUN apk update && \
    apk add --no-cache wget curl

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set environment variable for the port
ENV PORT=10000

# Start VSCode
CMD code-server --port $PORT --disable-telemetry --auth none
