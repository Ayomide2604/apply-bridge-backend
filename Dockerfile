FROM alpine:latest

WORKDIR /app

# Copy PocketBase binary and give it permission
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Copy data folders (optional)
COPY pb_data /app/pb_data
COPY pb_migrations /app/pb_migrations

# Expose default port
EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
