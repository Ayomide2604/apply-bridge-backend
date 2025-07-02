#!/bin/sh
chmod +x ./pocketbase
./pocketbase serve --http 0.0.0.0:$PORT
#!/bin/sh

# Make sure PocketBase binary is executable
chmod +x ./pocketbase

# Create admin if it doesn't exist
if ! ./pocketbase admin list | grep -q "admin@example.com"; then
  echo "🔐 Creating default admin account..."
  ./pocketbase admin create admin@example.com supersecure
else
  echo "✅ Admin already exists."
fi

# Start the PocketBase server
./pocketbase serve --http 0.0.0.0:$PORT
