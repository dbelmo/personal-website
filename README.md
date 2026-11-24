# David Belmonte — Personal Website & CV

Static CV and cybersecurity portfolio built with **Zola** (Rust) and served from a hardened `FROM scratch` **`static-web-server`** container.

## Run Locally in Docker

```bash
docker compose up --build -d
```

Open `http://localhost:8080`.

## Deploy on Any Small VM (with Automatic Let's Encrypt HTTPS)

```bash
SITE_DOMAIN=yourdomain.com docker compose --profile tls up --build -d
```

## Updating Content

- Edit [data/cv.toml](data/cv.toml) to update experience, certifications, education, skills, or languages.
- Rebuild with `docker compose up --build -d`.
