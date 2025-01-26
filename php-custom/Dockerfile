FROM php:8.1-fpm

# Install Python3 and pip
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Set up a virtual environment for Python dependencies
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Copy the requirements file and install dependencies in the virtual environment
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

# Set working directory
WORKDIR /app
