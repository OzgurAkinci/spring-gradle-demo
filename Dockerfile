FROM registry.access.redhat.com/ubi8/openjdk-17

ENV JAVA_APP_DIR="/deployments" \
    JAVA_APP_JAR="${APP_NAME}.jar" \
    JAVA_MAJOR_VERSION="17" \
    TZ="Eurepa/Istanbul"

USER root

COPY --from=build /build/libs/spring-gradle-demo-*.jar /deployments/spring-gradle-demo.jar

COPY application.sh /deployments/application.sh

CMD ["sh", "/deployments/application.sh"]