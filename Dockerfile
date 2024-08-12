# Step 1: Use an official Ubuntu base image
FROM ubuntu:22.04

# Step 2: Install dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    git \
    build-essential \
    libboost-all-dev \
    libssl-dev \
    libasio-dev \
    && rm -rf /var/lib/apt/lists/*

# Step 3: Set up the working directory
WORKDIR /usr/src/app

# Step 4: Clone the Crow repository
RUN git clone https://github.com/CrowCpp/Crow.git /opt/crow

# Step 5: Copy the project files into the container
COPY . .

# Step 6: Create build directory, compile the application, and verify binary location
RUN mkdir -p build && cd build && \
    cmake .. -DEXECUTABLE_OUTPUT_PATH=../bin && \
    make && \
    ls -l ../bin

# Step 7: Expose the port that your application will use
EXPOSE 8080

# Step 8: Set the default command to run the application
CMD ["./bin/my_crow_app"]
