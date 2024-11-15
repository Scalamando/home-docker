# Local Service Setup using Docker 

This respository contains my setup for some local services using docker. All
services are reverse proxied through traefik on ports 80 and 443 to allow for
easy access using the `*.localhost` domain. The services in this setup
currently include [Actual Budget](https://actualbudget.org/),
[glance](https://github.com/glanceapp/glance) and the [traefik
dashboard](https://doc.traefik.io/traefik/operations/dashboard/).

## Setup

For HTTPS to work you need to generate local certificate files. I use [`mkcert`]() for this purpose:

```sh
# If you're running mkcert for the first time
mkcert -instal

# Create certificates for all services
mkcert \
    -cert-file traefik/certs/local-cert.pem \
    -key-file traefik/certs/local-key.pem \
    actual.localhost \
    traefik.localhost \
    glance.localhost
```

> [!IMPORTANT]
> If you're using WSL, install `mkcert` on Windows and use `mkcert.exe`. This
> is necessary, as the windows certificate store will be used by most of your
> applications.

After setting up the certificates simply start the compose stack with `docker
compose up -d`. Now, all services should be accessible:

- *Actual Budget*: https://actual.localhost
- *Glance*: https://glance.localhost
- *Traefik Dashboard*: https://traefik.localhost

