#!/usr/bin/env bash

my_service "unregister" ${HD_SERVICE_NAME}
su ${HADOOP_HDFS_USER} --preserve-environment -c "${HADOOP_PREFIX}/bin/hdfs namenode -format -force"
