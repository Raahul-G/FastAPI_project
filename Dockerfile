# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install uv for fast dependency management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    UV_SYSTEM_PYTHON=1

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies globally using uv
RUN uv pip install --system -r pyproject.toml

# Copy and set permissions for startup script first
COPY docker-start.sh /app/docker-start.sh
RUN chmod +x /app/docker-start.sh

# Copy application code
COPY . .

# Expose ports for FastAPI and Streamlit
EXPOSE 8000 8501

# Run the Docker startup script using bash
CMD ["/bin/bash", "/app/docker-start.sh"]
