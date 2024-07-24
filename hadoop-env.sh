# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

# Set Hadoop-specific environment variables here.

# The java implementation to use.  Required.
export JAVA_HOME=/usr/local/openjdk-8

# The jsvc implementation to use. Jsvc is required to run secure datanodes
# export JSVC_HOME=${JSVC_HOME}

# Extra Java runtime options.  Empty by default.
# Add these options if you want the Yarn daemons to be started with a larger heap
# export YARN_RESOURCEMANAGER_HEAPSIZE=1000
# export YARN_NODEMANAGER_HEAPSIZE=1000

export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}

# Extra Java CLASSPATH elements.  Optional.
export HADOOP_CLASSPATH=${HADOOP_CLASSPATH}

# The maximum amount of heap to use, in MB. Default is 1000.
# export HADOOP_HEAPSIZE=1000

# Extra Java runtime options.  Empty by default.
# export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true -Dhadoop.security.logger=INFO,RFAS"

# Command specific options appended to HADOOP_OPTS when specified
export HDFS_NAMENODE_OPTS="-Dhadoop.security.logger=INFO,RFAS -Xmx1024m"
export HDFS_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS -Xmx1024m"
export HDFS_SECONDARYNAMENODE_OPTS="-Dhadoop.security.logger=INFO,RFAS -Xmx1024m"
export YARN_RESOURCEMANAGER_OPTS="-Dyarn.server.resourcemanager.appsummary.logger=INFO,RFA -Xmx1024m"
export YARN_NODEMANAGER_OPTS="-Xmx1024m"

# On secure datanodes, user to run the datanode as after dropping privileges
# This **MUST** be uncommented to enable secure HDFS
# export HADOOP_SECURE_DN_USER=yarn

# Where log files are stored.  $HADOOP_HOME/logs by default.
# export HADOOP_LOG_DIR=${HADOOP_LOG_DIR}/hadoop

# File naming remote slave hosts.  $HADOOP_HOME/etc/hadoop/slaves by default.
# export HADOOP_SLAVES=${HADOOP_CONF_DIR}/slaves

# host:path where hadoop code should be rsync'd from.  Unset by default.
# export HADOOP_MASTER=master:/home/$USER/src/hadoop

# Seconds to sleep between slave commands.  Unset by default.  This can be useful in large
# clusters, where, e.g., slave rsyncs can otherwise arrive faster than the master can
# service them.
# export HADOOP_SLAVE_SLEEP=0.1

# The directory where pid files are stored. /tmp by default.
# export HADOOP_PID_DIR=/var/hadoop/pids

# A string representing this instance of hadoop. $USER by default.
# export HADOOP_IDENT_STRING=$USER

# The scheduling priority for daemon processes.  See 'man nice'.
export HADOOP_NICENESS=10

# Add Hadoop bin/ directory to the PATH
export PATH=$PATH:$HADOOP_HOME/bin
