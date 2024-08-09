# Use a lightweight Alpine image as the base image
FROM alpine:3.18

# Install curl 
RUN apk add --no-cache curl

# Set the working directory
WORKDIR /app

# Copy the script into the container
COPY collect_metrics.sh .

# Create the metrics directory to store the metrics files
RUN mkdir -p /metrics

# Make the script executable
RUN chmod +x collect_metrics.sh

# Command to run the script
CMD ["sh","collect_metrics.sh"]