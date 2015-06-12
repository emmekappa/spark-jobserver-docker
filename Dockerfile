FROM emmekappa/docker-spark

MAINTAINER Michele Cantelli <emmekappa@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV JOBSERVER_HOME=/spark-jobserver-0.5.1
EXPOSE 8090

ADD *.sh $JOBSERVER_HOME/
ADD *.conf $JOBSERVER_HOME/
ADD *.jar $JOBSERVER_HOME/
ADD spark/conf/spark-env.sh $SPARK_HOME/conf/spark-env.sh

WORKDIR $JOBSERVER_HOME
CMD ./start.sh
