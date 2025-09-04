FROM tomcat:9.0-jdk17

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR
COPY target/week2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Render cấp PORT động qua biến môi trường
ENV PORT=8080
EXPOSE ${PORT}

# Config Tomcat để dùng PORT động
CMD ["sh", "-c", "sed -i 's/8080/${PORT}/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
