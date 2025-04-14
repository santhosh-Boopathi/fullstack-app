#!/bin/bash

# Set up the environment (if necessary)
echo "Setting up the environment..."
export NODE_ENV=production

# Pull the latest changes from Git
echo "Pulling the latest changes..."
git pull origin master

# Install dependencies for backend (inside the server directory)
echo "Installing backend dependencies..."
cd /home/ubuntu/fullstack-app/server
npm install --production

# Install dependencies for frontend (inside the client directory)
echo "Installing frontend dependencies..."
cd /home/ubuntu/fullstack-app/client
npm install --production

# Build the React frontend
echo "Building React frontend..."
npm run build
cd ..

# Restart the backend server (e.g., Node.js app using pm2)
echo "Restarting backend server..."
cd /home/ubuntu/fullstack-app/server

# Make sure that the app.js exists in the server folder.
if [ -f "app.js" ]; then
  pm2 stop app_name || pm2 start app.js --name "backend"
else
  echo "Error: app.js not found in /home/ubuntu/fullstack-app/server/"
  exit 1
fi

# If using Docker instead of pm2, restart the containers (optional)
# echo "Restarting Docker containers..."
# cd /home/ubuntu/fullstack-app
# docker-compose down && docker-compose up -d

echo "Deployment completed successfully!"
