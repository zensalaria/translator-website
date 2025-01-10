# Use the official Python slim image as the base
FROM python:3.9-slim

# Set environment variables to prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libsndfile1-dev \
    libssl-dev \
    libffi-dev \
    git \
    python3-dev \
    cmake && \
    rm -rf /var/lib/apt/lists/*

# Install a specific version of pip below 24.1 to avoid any potential issues
RUN pip install --upgrade pip==23.0.1

# Copy the application code
COPY . /app/

# Expose the port the app runs on
EXPOSE 5001

# Command to run the application
CMD ["python", "app.py"]
