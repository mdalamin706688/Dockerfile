FROM tomcat:9.0-jre11-openjdk

# Define GeoServer version as an environment variable
ENV GEOSERVER_VERSION=2.21.0

# Download GeoServer WAR file directly and move it to the Tomcat webapps directory in a single step
RUN wget https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip -O /tmp/geoserver.war && \
    mv /tmp/geoserver.war /usr/local/tomcat/webapps/geoserver.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
