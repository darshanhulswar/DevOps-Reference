FROM tomcat:9.0-jdk11

# Optional: Ensure default apps exist
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# Copy your WAR
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war

EXPOSE 8081

CMD ["catalina.sh", "run"]
