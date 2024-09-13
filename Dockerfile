# Use the official GeoServer base image
FROM docker.osgeo.org/geoserver:2.23.x

# Set environment variables for extensions if needed
ENV INSTALL_EXTENSIONS=true
ENV STABLE_EXTENSIONS="ysld,h2"

# Expose port 8080 for GeoServer
EXPOSE 8080

# Define the entrypoint to start GeoServer
CMD ["catalina.sh", "run"]
