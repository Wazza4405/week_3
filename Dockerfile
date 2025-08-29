# Sử dụng JDK 17
FROM openjdk:17-jdk-slim

# Copy source hoặc build trước rồi copy JAR
WORKDIR /app
COPY target/week3.jar app.jar

# Chạy app
CMD ["java", "-jar", "app.jar"]
