# Sử dụng Tomcat 9 với JDK 17
FROM tomcat:9.0-jdk17

# Xóa ứng dụng mặc định của Tomcat (ROOT)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build vào Tomcat
COPY target/week2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]


