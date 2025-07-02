#!/bin/sh

chmod +x ./pocketbase

ADMIN_EMAIL=${ADMIN_EMAIL:-admin@example.com}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-supersecure}

# Create superuser if not already created
if ! ./pocketbase superuser list | grep -q "$ADMIN_EMAIL"; then
  echo "🔐 Creating default superuser account..."
  ./pocketbase superuser upsert "$ADMIN_EMAIL" "$ADMIN_PASSWORD"
else
  echo "✅ Superuser already exists."
fi

# Start the PocketBase server
./pocketbase serve --http 0.0.0.0:$PORT
