#!/usr/bin/env bash
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
/remove_alias.sh # problems with hostname alias, see https://issues.apache.org/jira/browse/SPARK-6680
echo 127.0.0.1 $HOSTNAME >> /etc/hosts 

#source $SPARK_HOME/conf/spark-env.sh
echo "" >> $JOBSERVER_CONF

[ ! "$SPARK_MASTER" ] && SPARK_MASTER="spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT}"

#export MASTER="spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT}"
echo "spark { master = \"${MASTER}\" }" >> $JOBSERVER_CONF 
$JOBSERVER_HOME/_server_start.sh
tail -f /dev/null
