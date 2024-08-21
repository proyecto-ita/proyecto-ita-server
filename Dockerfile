FROM eclipse-temurin:21-jdk as builder

COPY . /app
WORKDIR /app

RUN chmod +x mvnw
RUN ./mvnw package -DskipTests
RUN mv -f target/*.jar app.jar


FROM eclipse-temurin:21-jre as runtime

RUN mkdir -p /app/images

ARG PORT
ENV PORT=${PORT}

EXPOSE ${PORT}

COPY --from=builder /app/app.jar .

RUN useradd runtime
USER runtime

RUN chown -R runtime:runtime /app/images

ENTRYPOINT ["java", "-Dserver.port=${PORT}", "-jar", "app.jar"]
