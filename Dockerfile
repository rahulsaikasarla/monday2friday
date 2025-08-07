FROM nginx:latest

LABEL maintainer="rahulkasarla@yahoo.com"

# Install required packages
RUN apt update -y && \
    apt install -y nano tree iputils-ping git && \
    rm -rf /var/lib/apt/lists/*

# Remove the default error page
RUN rm /usr/share/nginx/html/50x.html

# Clone the repo into the nginx html directory
RUN rm -rf /usr/share/nginx/html/* && \
    git clone https://github.com/rahulsaikasarla/monday2friday.git /usr/share/nginx/html/

# Expose port 80 (optional, for documentation)
EXPOSE 80

# Default command to run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
