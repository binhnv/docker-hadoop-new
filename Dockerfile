FROM binhnv/hadoop-base:1.0.3
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122

RUN rm -f /etc/service/sshd/down

# directories to create in HDFS when start
ENV HD_INIT_DIRS="" \
    HD_SERVICE_NAME="hadoop"

COPY services ${MY_SERVICE_DIR}/
COPY scripts/init ${MY_INIT_DIR}
COPY scripts/startup ${MY_STARTUP_DIR}
