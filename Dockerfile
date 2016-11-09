FROM binhnv/hadoop-base
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

RUN rm -f /etc/service/sshd/down

# directories to create in HDFS when start
ENV HD_INIT_DIRS=""

COPY services ${MY_SERVICE_DIR}/
COPY scripts/init ${MY_INIT_DIR}
COPY scripts/startup ${MY_STARTUP_DIR}
