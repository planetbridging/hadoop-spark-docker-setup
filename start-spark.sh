#!/bin/bash

# Export JAVA_HOME
export JAVA_HOME=/usr/local/openjdk-8

if [ "$HOSTNAME" == "spark-master" ]; then
    $SPARK_HOME/sbin/start-master.sh
else
    $SPARK_HOME/sbin/start-worker.sh spark://spark-master:7077
fi

# Keep container running
tail -f /dev/null
