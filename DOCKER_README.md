# Docker - Google Reviews Scraper Pro (API)

## Build

```bash
podman build -t google-reviews-scraper-api .
```

## Run

Monta il file `config.yaml` e il database SQLite (se esistente) come volumi:

```bash
podman run -d \
  --name scraper-api \
  -p 8000:8000 \
  -v $(pwd)/config.yaml:/app/config.yaml \
  -v $(pwd)/reviews.db:/app/reviews.db \
  google-reviews-scraper-api
```

Senza database esistente, la prima esecuzione lo creerà dentro al container.
Per persistenza, monta una directory vuota su `/app/data` e imposta `db_path` nel config.

### Variabili d'ambiente

| Variabile | Default | Descrizione |
|-----------|---------|-------------|
| `ALLOWED_ORIGINS` | `*` (dal config) | Origini CORS separate da virgola |
