#!/bin/bash

# Set versions
HADOOP_VERSION=3.3.6
SPARK_VERSION=3.4.3
HADOOP_URL=https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
SPARK_URL=https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz

# Download Hadoop
if [ ! -f hadoop-$HADOOP_VERSION.tar.gz ]; then
  echo "Downloading Hadoop..."
  wget $HADOOP_URL
fi

# Download Spark
if [ ! -f spark-$SPARK_VERSION-bin-hadoop3.tgz ]; then
  echo "Downloading Spark..."
  wget $SPARK_URL
fi
