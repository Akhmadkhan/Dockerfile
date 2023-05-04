FROM ubuntu:16.04

ARG UID=1000

# Install nano
RUN apt-get update && apt-get install -y nano

# Set environment variable
ENV EDITOR nano

# Set working directory
WORKDIR /home/stepik
VOLUME /home/stepik

# Create a user with specified UID and set it as the owner of the working directory
RUN useradd -u ${UID} stepik \
    && chown -R stepik:stepik /home/stepik

# Set the user as the main user in the container
USER stepik

# Set entrypoint to open nano by default
ENTRYPOINT ["nano"]

# Set default command
CMD ["test"]
