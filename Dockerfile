# Step 1: Use official Nginx image from the Docker Hub
FROM nginx:alpine

# Step 2: Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Step 3: Copy all your application files (HTML, CSS, JS) into the Nginx directory
COPY . .

# Step 4: Expose port 9000 (though Nginx defaults to port 80, we'll use 9000 as requested)
EXPOSE 9001

# Step 5: Change Nginx default configuration to listen on port 9000 (optional)
RUN sed -i 's/80/9001/' /etc/nginx/conf.d/default.conf

# Nginx will automatically serve the files from /usr/share/nginx/html directory

# Step 6: hehe
