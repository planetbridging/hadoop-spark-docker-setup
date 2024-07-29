#!/bin/bash

# Export JAVA_HOME
export JAVA_HOME=/usr/local/openjdk-8
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$JAVA_HOME/bin

# Log JAVA_HOME to confirm it's set
echo "JAVA_HOME is set to: $JAVA_HOME"

# Start SSH service
service ssh start

# Create a directory to store the FORMATTED file if it doesn't exist
mkdir -p /usr/local/hadoop/formatted

# Format namenode (only if not already formatted)
if [ ! -f "/usr/local/hadoop/formatted/FORMATTED" ]; then
    echo "Formatting NameNode..."
    yes Y | $HADOOP_HOME/bin/hdfs namenode -format
    touch /usr/local/hadoop/formatted/FORMATTED
else
    echo "NameNode already formatted."
fi

# Start HDFS
$HADOOP_HOME/sbin/start-dfs.sh

# Wait for HDFS to start
sleep 10

# Set ownership and permissions for HDFS directories
#$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/dr.who
#$HADOOP_HOME/bin/hdfs dfs -chown dr.who:supergroup /user/dr.who
#$HADOOP_HOME/bin/hdfs dfs -chmod 755 /user/dr.who

# Set ownership and permissions for HDFS directories
su hdfs -c "$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/dr.who"
su hdfs -c "$HADOOP_HOME/bin/hdfs dfs -chown dr.who:supergroup /user/dr.who"
su hdfs -c "$HADOOP_HOME/bin/hdfs dfs -chmod 755 /user/dr.who"
su hdfs -c "$HADOOP_HOME/bin/hdfs dfs -chmod 777 /"

groupadd supergroup
usermod -a -G supergroup dr.who

# Keep container running
tail -f /dev/null
