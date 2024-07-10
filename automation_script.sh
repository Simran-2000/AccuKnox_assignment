#!/bin/bash

# Retrieve Docker container IDs or names based on your setup
FRONTEND_CONTAINER=$(docker ps --filter "name=frontend" --format "{{.ID}}")
BACKEND_CONTAINER=$(docker ps --filter "name=backend" --format "{{.ID}}")

if [ -z "$FRONTEND_CONTAINER" ] || [ -z "$BACKEND_CONTAINER" ]; then
    echo "Error: Frontend or backend containers not found."
    exit 1
fi

echo "Testing integration between frontend and backend..."

# Get backend message
BACKEND_MESSAGE=$(docker exec $BACKEND_CONTAINER curl -s http://localhost:8080/api/message)

if [ -z "$BACKEND_MESSAGE" ]; then
    echo "Error: Failed to retrieve message from backend."
    exit 1
fi

# Get frontend message
FRONTEND_MESSAGE=$(docker exec $FRONTEND_CONTAINER curl -s http://localhost:80)

# Check if frontend displays the backend message correctly
if [[ "$FRONTEND_MESSAGE" != *"$BACKEND_MESSAGE"* ]]; then
    echo "Error: Frontend does not display backend message correctly."
    exit 1
fi

echo "Integration test successful!"
