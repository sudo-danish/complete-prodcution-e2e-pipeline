FROM maven:3-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM maven:3-openjdk-17-slim
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /app/
EXPOSE 8080
CMD ["java", "-jar","demoapp.jar"]

