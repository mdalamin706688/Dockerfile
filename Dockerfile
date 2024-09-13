# Use OpenJDK image
FROM openjdk:8-jre

# Set GeoServer version
ENV GEOSERVER_VERSION 2.21.0

# Set GeoServer home directory
ENV GEOSERVER_HOME /opt/geoserver

# Install dependencies: curl, unzip
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean

# Download and extract GeoServer
RUN curl -L -o /tmp/geoserver.zip \
    https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip/download && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} /opt/geoserver && \
    rm /tmp/geoserver.zip

# Set working directory
WORKDIR $GEOSERVER_HOME

# Expose default GeoServer port
EXPOSE 8080

# Start GeoServer
CMD ["sh", "-c", "cd /opt/geoserver/bin && ./startup.sh"]
