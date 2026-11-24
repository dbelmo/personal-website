# =============================================================================
# Stage 1: Static Build with Zola (Single-Binary Rust SSG, Zero Node.js)
# =============================================================================
FROM ghcr.io/getzola/zola:v0.22.1 AS builder

ARG BASE_URL="http://localhost:8080"

WORKDIR /site
COPY config.toml ./
COPY data ./data
COPY content ./content
COPY templates ./templates
COPY sass ./sass
COPY static ./static

# Exec form works cleanly even on minimal/scratch builder images
RUN ["/bin/zola", "build", "--output-dir", "/dist"]

# =============================================================================
# Stage 2: Hardened Runtime (FROM scratch + Rust static-web-server)
# - ~5 MB image, zero shell (/bin/sh), zero package manager, non-root user
# =============================================================================
FROM joseluisq/static-web-server:2.39.0 AS runtime

COPY --from=builder /dist /public
COPY sws.toml /etc/sws/sws.toml

USER 65532:65532
EXPOSE 8080

CMD ["--config-file", "/etc/sws/sws.toml"]
