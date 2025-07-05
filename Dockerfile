FROM python:3.14-rc-alpine

# Install ffmpeg and other dependencies
RUN apk add --no-cache ffmpeg

# Set work directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Set environment variables for Python output
ENV PYTHONUNBUFFERED=1

# Entrypoint: pass arguments to main.py
# Usage example:
# docker run -v $(pwd)/output:/app/output aniworld-scraper --type anime --name made-in-abyss --lang Deutsch --dl-mode Series --season-override 0 --provider VOE
ENTRYPOINT ["python", "main.py"]