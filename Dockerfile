FROM python:3.13-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY modules/ modules/
COPY api_server.py start.py pyproject.toml ./

ENV CHROME_BIN=/usr/bin/chromium

EXPOSE 8000

CMD ["uvicorn", "api_server:app", "--host", "0.0.0.0", "--port", "8000"]
