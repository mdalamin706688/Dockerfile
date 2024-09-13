# Base image with OpenJDK 17 for broader compatibility
FROM eclipse-temurin:17-slim

# Set working directory
WORKDIR /opt/geoserver

# Download GeoServer WAR file (replace with desired version)
RUN wget https://downloads.sourceforge.net/geoserver/geoserver-2.29.2.war -O geoserver.war

# Expose GeoServer port (default: 8080)
EXPOSE 8080

# Environment variables for GeoServer configuration (modify as needed)
ENV GEOSERVER_DATA_DIR=/data

# Copy WAR file and create data directory
COPY geoserver.war .
RUN mkdir -p $GEOSERVER_DATA_DIR

# Start GeoServer using the provided wrapper script (modify if needed)
CMD ["/opt/geoserver/bin/startup.sh"]