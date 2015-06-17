#!/usr/bin/env bash

source /spark-env.sh
echo "" >> $JOBSERVER_CONF

[ ! "$SPARK_MASTER" ] && SPARK_MASTER="spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_PORT_7077_TCP_PORT}"
echo "spark { master = \"${SPARK_MASTER}\" }" >> $JOBSERVER_CONF 

get_abs_script_path() {                                                         
  pushd . >/dev/null                                                            
  cd $(dirname $0)                                                              
  appdir=$(pwd)                                                                 
  popd  >/dev/null                                                              
}                                                                               
                                                                                
get_abs_script_path 

MAIN="spark.jobserver.JobServer"
CLASSPATH="$appdir:$appdir/spark-job-server.jar:$($SPARK_HOME/bin/compute-classpath.sh)"
CONFFILE=sparkcluster.conf
exec java -cp $CLASSPATH $GC_OPTS $JAVA_OPTS $LOGGING_OPTS $CONFIG_OVERRIDES $MAIN $CONFFILE 2>&1 
