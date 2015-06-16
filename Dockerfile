FROM emmekappa/docker-spark

MAINTAINER Michele Cantelli <emmekappa@gmail.com>

# Setup
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
RUN CODENAME=$(lsb_release -cs)

# Add the repository
RUN echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list
RUN sudo apt-get -y update
RUN apt-get -y install mesos

ENV DEBIAN_FRONTEND=noninteractive
ENV JOBSERVER_HOME=/spark-jobserver-0.5.1
ENV JOBSERVER_CONF=$JOBSERVER_HOME/sparkcluster.conf
EXPOSE 8090

ADD *.sh $JOBSERVER_HOME/
ADD *.conf $JOBSERVER_HOME/
ADD *.jar $JOBSERVER_HOME/
ADD spark/conf/spark-env.sh $SPARK_HOME/conf/spark-env.sh

WORKDIR $JOBSERVER_HOME
CMD ./jobserver_start.sh
