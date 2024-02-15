# Use the Nginx image from Docker Hub
FROM nginx

# Remove the default Nginx configuration file
RUN if [ -f /etc/nginx/nginx.conf ]; then rm /etc/nginx/nginx.conf; fi

# Add a new Nginx configuration file
COPY nginx.conf /etc/nginx/

#COPY index.html /usr/share/nginx/html/

# Expose ports
EXPOSE 80

# Start Nginx when the container has provisioned
CMD ["nginx", "-g", "daemon off;"]


#RUN apt-get update && apt-get install -y curl
RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | tar zx && \
    mv oc /usr/local/bin/ && \
    rm -f openshift-client-linux.tar.gz
