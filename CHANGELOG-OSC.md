# Eyevinn Open Source Cloud - Processing History

## Changelog

- **2026-03-22T20:56:30.535Z**: Project synchronized with upstream by OSaaS Service Builder

# OSC Changelog

## OSC Containerization — 2026-03-21

### Added
- `Dockerfile.osc` — Production Docker image for Eyevinn Open Source Cloud
- `osc-entrypoint.sh` — OSC entrypoint handling PORT, OSC_HOSTNAME, DATABASE_URL, REDIS_URL
- `README-OSC.md` — OSC-specific documentation and getting started guide

### Notes
- Nginx is configured dynamically at runtime to listen on `$PORT` (default 8080)
- `OSC_HOSTNAME` is mapped to `MAIN_URL`, `FRONTEND_URL`, and `NEXT_PUBLIC_BACKEND_URL`
- Uploads are stored at `/uploads` (persistent volume recommended)
- Requires external PostgreSQL and Redis services
