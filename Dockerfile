# Use the official Caddy builder image to add the rate limit module
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit

# Create the final lightweight Caddy image
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Copy the Caddyfile into the container
COPY Caddyfile /etc/caddy/Caddyfile

# Expose the required ports
EXPOSE 80 443

# Run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]


# To build the image
# docker build -t my-caddy-ratelimit .

# To run
# docker run -d --name caddy -p 8080:80 -p 8443:443 my-caddy-ratelimit

# To run with auto-remove:
# docker run --rm -d --name caddy -p 8080:80 -p 8443:443 my-caddy-ratelimit
