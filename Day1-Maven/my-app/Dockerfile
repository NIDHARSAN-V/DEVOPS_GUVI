# Use an official OpenJDK image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the target directory
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# Expose port 8800
EXPOSE 8800

# Run the application
CMD ["java", "-jar", "app.jar"]
