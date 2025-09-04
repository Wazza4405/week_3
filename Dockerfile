# Stage 1: Build WAR bằng Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR trên Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat

# Xóa webapp mặc định
RUN rm -rf webapps/*

# Copy file WAR đã build vào ROOT
COPY --from=build /app/target/*.war webapps/ROOT.war

# Render cấp PORT động
ENV PORT=8080
EXPOSE ${PORT}

# Fix shutdown port + đổi cổng 8080 sang $PORT rồi chạy Tomcat
CMD ["sh", "-c", "sed -i 's/port=\"8005\"/port=\"-1\"/' conf/server.xml && sed -i 's/8080/${PORT}/' conf/server.xml && catalina.sh run"]
