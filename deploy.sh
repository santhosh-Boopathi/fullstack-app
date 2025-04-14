#!/bin/bash

# Set up the environment (if necessary)
echo "Setting up the environment..."
export NODE_ENV=production

# Pull the latest changes (if you have a Git repo on your EC2 instance)
echo "Pulling the latest changes..."
git pull origin master

# Install dependencies
echo "Installing dependencies..."
npm install --production

# Build the React frontend
echo "Building React frontend..."
cd client && npm run build && cd ..

# Restart the backend server (e.g., Node.js app using pm2)
echo "Restarting backend server..."
pm2 restart app_name || pm2 start app.js --name "app_name"

# Or, if you're using Docker, restart the containers
# docker-compose down && docker-compose up -d

echo "Deployment completed successfully!"
