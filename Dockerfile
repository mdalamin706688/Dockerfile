# Use OpenJDK 17 for better support and security
FROM openjdk:17-slim

# Set GeoServer version
ENV GEOSERVER_VERSION 2.21.0

# Set GeoServer home directory
ENV GEOSERVER_HOME /opt/geoserver

# Install wget (if missing)
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download and extract GeoServer
RUN wget -qO- https://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-bin.zip/download
RUN bsdtar -xvf- -C /opt
RUN mv /opt/geoserver-$GEOSERVER_VERSION /opt/geoserver

# Set working directory
WORKDIR $GEOSERVER_HOME

# Expose default GeoServer port
EXPOSE 8080

# Start GeoServer
CMD ["sh", "-c", "cd /opt/geoserver/bin && ./startup.sh"]