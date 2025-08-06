# Planetary Agents Deployment

## Overview

This repository contains the deployment setup for 8 planetary agents, each running a FastAPI server with health checks, background tasks, and CORS enabled. The agents are containerized with Docker, orchestrated via Docker Compose, and proxied through NGINX.

---

## Contents

- **FastAPI app.py**: [FastAPI app example](#fastapi-app-py)
- **Docker Compose**: [docker-compose.agents.yml](#docker-compose-agentsyml)
- **NGINX Config**: [nginx.agents.conf](#nginx-agentsconf)
- **Deploy Script**: [deploy-agents.sh](#deploy-agentssh)
- **Sample Dockerfile**: Per agent folder Dockerfile example
- **Health Check Dashboard**: Simple web UI to monitor agent health
- **Logging Aggregation**: Instructions for centralized log monitoring
- **API Versioning & Docs**: OpenAPI docs exposed via FastAPI

---

## Setup & Deployment

### Prerequisites

- Docker & Docker Compose installed
- Network access to your platform domains for CORS and NGINX proxy
- Ports 8001-8008 available on host machine

### Steps

1. **Clone the repository** and navigate to the root directory.

2. **Build and deploy agents:**

   ```bash
   ./deploy-agents.sh


docker logs mars-agent
sudo nginx -s reload
server {
    listen 80;
    server_name aikre8tive.xyz www.aikre8tive.xyz;

    # Redirect root to your hosted HTML file
    return 301 https://yourhost.com/deployment-urls.html;
}
./deploy-agents.sh




chmod +x deploy.sh
chmod +x deploy-agents.sh
sudo nginx -t
sudo nginx -s reload
hsususu
  #!/bin/bash

NGINX_CONF="/etc/nginx/conf.d/aikre8tive.conf"
WEB_ROOT="/var/www/aikre8tive/docs"

# Create web root directory if it doesn't exist
sudo mkdir -p "$WEB_ROOT"

# (Optional) Copy your Tailwind HTML and assets to $WEB_ROOT here, e.g.:
# sudo cp /path/to/your/index.html "$WEB_ROOT/"
# sudo cp -r /path/to/your/assets "$WEB_ROOT/"

# Write Nginx server block config
sudo tee "$NGINX_CONF" > /dev/null <<EOF
server {
    listen 80;
    server_name aikre8tive.xyz www.aikre8tive.xyz;

    root $WEB_ROOT;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    # Serve static assets if any (adjust path as needed)
    location /assets/ {
        alias $WEB_ROOT/assets/;
    }

    # Optional security headers
    add_header X-Content-Type-Options "nosniff" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
}
