#!/bin/bash

# Export JAVA_HOME
export JAVA_HOME=/usr/local/openjdk-8
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$JAVA_HOME/bin

# Log JAVA_HOME to confirm it's set
echo "JAVA_HOME is set to: $JAVA_HOME"

# Start SSH service
service ssh start

# Format namenode (only for the first time)
if [ ! -d "/usr/local/hadoop/data/nameNode/current" ]; then
    $HADOOP_HOME/bin/hdfs namenode -format
fi

# Start HDFS
$HADOOP_HOME/sbin/start-dfs.sh

# Keep container running
tail -f /dev/null
