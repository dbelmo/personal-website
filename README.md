# David Belmonte — Personal Website & CV

Static CV and cybersecurity portfolio built with **Zola** (Rust) and served from a hardened `FROM scratch` **`static-web-server`** container.

## Run Locally in Docker

```bash
docker compose up --build -d
```

Open `http://localhost:8080`.

## Deploy on Cloudflare Pages

Connect `dbelmo/personal-website` in **Cloudflare Dashboard → Workers & Pages → Create → Pages → Connect to Git** with:

- **Build command:** `zola build --base-url $CF_PAGES_URL`
- **Build output directory:** `public`
- **Environment variable:** `ZOLA_VERSION` = `0.22.1`

Security and cache headers are mirrored from `sws.toml` into [static/_headers](static/_headers).

## Deploy on Any Small VM (with Automatic Let's Encrypt HTTPS)

```bash
SITE_DOMAIN=yourdomain.com docker compose --profile tls up --build -d
```

## Updating Content

- Edit [data/cv.toml](data/cv.toml) to update experience, certifications, education, skills, or languages.
- Rebuild with `docker compose up --build -d`.
