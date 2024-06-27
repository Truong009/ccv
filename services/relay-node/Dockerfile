# Use an official Golang image as the base image
FROM golang:1.22

ARG ETH_PRIVATE_KEY
ENV ETH_PRIVATE_KEY=${ETH_PRIVATE_KEY}

# Set the working directory inside the container
WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y git curl

# Copy wait-for-it.sh into the image
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Clone the repository
RUN git clone https://github.com/cuckoo-network/cuckoo.git

# Navigate to the specific directory
WORKDIR /app/cuckoo/packages/node

# Build the Go application with specified flags
RUN go build -tags netgo -ldflags '-s -w' -o app

# Set the environment variable
ENV NODE_TYPE=MINER

# Define the command to run the application
CMD ["/usr/local/bin/wait-for-it.sh", "auto:7860", "--", "./app"]
