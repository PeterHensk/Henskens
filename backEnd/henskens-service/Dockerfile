# Use the official OpenJDK image as a parent image
FROM openjdk:8-jre

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot application JAR file into the container
COPY target/henskens-service.jar /app/henskens-service.jar

# Expose the port that your Spring application is running on
EXPOSE 8080

# Command to run your Spring Boot application
CMD ["java", "-jar", "henskens-service.jar"]
