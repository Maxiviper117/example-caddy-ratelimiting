# Example Caddy Rate Limiting Repository

This repository demonstrates how to configure Caddy with rate limiting.

## Overview

- Uses a custom Dockerfile to build Caddy with the [caddy-ratelimit](https://github.com/mholt/caddy-ratelimit) module.
- Provides a Caddyfile with two rate limiting zones:
  - **Static Zone:** Applies globally to all GET requests.
  - **Dynamic Zone:** Applies separately per client IP.

## Files
- **Caddyfile:** Configuration for Caddy and rate limiting.
- **Dockerfile:** Builds the custom Caddy image with the rate limit module.
- **docker-compose.yml:** Runs Caddy with Docker Compose.
- **test_ratelimit.sh:** Script to test rate limit behavior.

## Getting Started

1. **Build the Docker image:**
   ```bash
   docker build -t my-caddy-ratelimit .
   ```
2. **Run with Docker Compose:**
   ```bash
   docker-compose up --build -d
   ```
3. **Testing Rate Limiting:**
   Run the test script:
   ```bash
   ./test_ratelimit.sh
   ```

## Notes
- Adjust the test script and Caddyfile configurations as needed for your environment.
- The repository provides an example setup for demonstration purposes.
