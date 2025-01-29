# Use the official PHP image as the base image
FROM php:8.2-cli

# Set the working directory inside the container
WORKDIR /app

# Copy the PHP script and other files into the container
COPY . /app

# Expose port 10000 (or any port you want to use)
EXPOSE 10000

# Start the PHP development server
CMD ["php", "-S", "0.0.0.0:10000"]
