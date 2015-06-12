#!/usr/bin/env bash

#export SPARK_LOCAL_DIRS="/mnt/spark"

export SPARK_MASTER_IP=$SPARK_MASTER_PORT_7077_TCP_ADDR}
export MASTER="spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT}"

export SPARK_SUBMIT_LIBRARY_PATH="$SPARK_SUBMIT_LIBRARY_PATH:/root/ephemeral-hdfs/lib/native/"
export SPARK_SUBMIT_CLASSPATH="$SPARK_CLASSPATH:$SPARK_SUBMIT_CLASSPATH:/root/ephemeral-hdfs/conf"

# Bind Spark's web UIs to this machine's public EC2 hostname:
#export SPARK_PUBLIC_DNS=`wget -q -O - http://169.254.169.254/latest/meta-data/public-hostname`
export SPARK_PUBLIC_DNS=$SPARK_MASTER_IP
