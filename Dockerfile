# Use OpenJDK 17 for better support and security
FROM openjdk:17-jre

# Set GeoServer version
ENV GEOSERVER_VERSION 2.21.0

# Set GeoServer home directory
ENV GEOSERVER_HOME /opt/geoserver

# Download and extract GeoServer
RUN wget -qO- https://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-bin.zip/download \
    | bsdtar -xvf- -C /opt && mv /opt/geoserver-$GEOSERVER_VERSION /opt/geoserver

# Set working directory
WORKDIR $GEOSERVER_HOME

# Expose default GeoServer port
EXPOSE 8080

# Start GeoServer
CMD ["sh", "-c", "cd /opt/geoserver/bin && ./startup.sh"]