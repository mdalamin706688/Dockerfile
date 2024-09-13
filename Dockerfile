FROM tomcat:9.0-jre11-openjdk

# Download GeoServer WAR file directly
RUN wget https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}.war -O /opt/geoserver.war

# Copy GeoServer WAR file
COPY /opt/geoserver.war /usr/local/tomcat/webapps/geoserver.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]