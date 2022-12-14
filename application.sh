#!/bin/sh
cd /deployments

JAVA_OPTIONS="$OTHER_JAVA_OPTIONS $JAVA_OPTIONS"
JAVA_OPTIONS="$JAVA_OPTIONS -Dspring.profiles.default=$ACTIVE_PROFILE -Dspring.profiles.active=$ACTIVE_PROFILE"
if [ ! -z $SERVER_PORT ]
then
        JAVA_OPTIONS="$JAVA_OPTIONS -Dserver.port=$SERVER_PORT"
else
        JAVA_OPTIONS="$JAVA_OPTIONS -Dserver.port=8080"
fi

export JAVA_OPTIONS

echo "Starting the Java application using /opt/jboss/container/java/run/run-java.sh ..."
exec /opt/jboss/container/java/run/run-java.sh