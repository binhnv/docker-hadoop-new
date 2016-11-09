#!/usr/bin/env bash

/sbin/my_wait_for_file ${KRB_SERVICE_KEYTAB_FILE}
su ${HADOOP_HDFS_USER} --preserve-environment -c "${HADOOP_PREFIX}/bin/hdfs namenode -format -force"
