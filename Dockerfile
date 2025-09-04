# Sử dụng Tomcat 9 với JDK 17
FROM tomcat:9.0-jdk17

# Xóa ứng dụng mặc định của Tomcat (ROOT)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào thư mục webapps
COPY target/week3.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat sẽ tự động deploy ROOT.war khi container khởi động
EXPOSE 8080

CMD ["catalina.sh", "run"]

