#!/bin/bash
set -e

PORT="${PORT:-8080}"
export PORT

# Map OSC_HOSTNAME to application URL variables
if [ -n "$OSC_HOSTNAME" ]; then
  export MAIN_URL="https://${OSC_HOSTNAME}"
  export FRONTEND_URL="https://${OSC_HOSTNAME}"
  export NEXT_PUBLIC_BACKEND_URL="https://${OSC_HOSTNAME}/api"
fi

# Parse DATABASE_URL into components if provided
if [ -n "$DATABASE_URL" ]; then
  export DATABASE_URL="$DATABASE_URL"
fi

# Parse REDIS_URL if provided
if [ -n "$REDIS_URL" ]; then
  export REDIS_URL="$REDIS_URL"
fi

# Default storage to local if not set
export STORAGE_PROVIDER="${STORAGE_PROVIDER:-local}"
export UPLOAD_DIRECTORY="${UPLOAD_DIRECTORY:-/uploads}"
export NEXT_PUBLIC_UPLOAD_DIRECTORY="${NEXT_PUBLIC_UPLOAD_DIRECTORY:-/uploads}"

# Generate nginx config with the correct port
cat > /etc/nginx/nginx.conf <<EOF
user www;
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    access_log /var/log/nginx/access.log;
    client_max_body_size 2G;
    server {
        listen ${PORT};
        server_name _;
        gzip on;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        location /api/ {
            proxy_pass http://localhost:3000/;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }

        location /uploads/ {
            alias /uploads/;
        }

        location / {
            proxy_pass http://localhost:4200/;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }
}
EOF

exec "$@"
