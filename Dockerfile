# Use Python Slim Image
FROM python:3.10-slim-bullseye

# Set environment variable
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app/

# Install dependencies first to optimize Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Install dos2unix and fix line endings (if needed)
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

# Expose port
EXPOSE 8000

# Run the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
