# Stage 1: Build bằng Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Chạy trên Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat

# Xóa webapps mặc định
RUN rm -rf webapps/*

# Copy file WAR từ build stage
COPY --from=build /app/target/*.war webapps/ROOT.war

# Render sẽ truyền PORT qua biến môi trường
ENV PORT=8080
EXPOSE ${PORT}

# Thay thế port 8080 bằng $PORT trong server.xml
CMD ["sh", "-c", "sed -i 's/8080/${PORT}/' conf/server.xml && catalina.sh run"]
