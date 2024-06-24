# selecting nginx as the base image:
FROM nginx:latest

# Setting the working directory
WORKDIR /app

# Copy all the files in current path to nginx app default path
COPY build /usr/share/nginx/html/


# Expose the application to visible on the browser:
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]

