# Use a lightweight base image for efficiency
FROM ubuntu:20.04

# Update package lists
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    unzip

# Add the GeoServer repository (replace with desired version)
RUN add-apt-repository ppa:ubuntugis/geotools-stable
RUN apt-get update

# Install GeoServer and dependencies
RUN apt-get install -y \
    openjdk-11-jre \
    tomcat9 \
    tomcat9-admin \
    tomcat9-webapps \
    libgeotiff-java \
    geotools \
    geoserver

# Create GeoServer data directory (persistent volume)
RUN mkdir -p /var/lib/geoserver/data

# Copy GeoServer configuration (optional, for persistence)
# Replace `/path/to/your/config.xml` with your actual configuration file
COPY config.xml /etc/geoserver/config.xml

# Expose GeoServer port (default: 8080)
EXPOSE 8080

# Run GeoServer on startup
CMD ["geoserver-web", "-Dserver.startup=ADMIN"]