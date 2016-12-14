#!/bin/bash

local_file="/tmp/input.txt"
user_dir="/user/${MY_USER}"
in_dir="${user_dir}/in"
out_dir="hdfs://${user_dir}/out"
examples_jar="${HADOOP_COMMON_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-${HD_VERSION}.jar"

echo "hello world" > ${local_file}

kinit -kt ${KRB_KEYTAB_DIR}/${MY_USER}.keytab ${MY_USER}
${HADOOP_COMMON_HOME}/bin/hadoop fs -mkdir -p ${in_dir} \
    && ${HADOOP_COMMON_HOME}/bin/hadoop fs -put -f ${local_file} ${in_dir} \
    && ${HADOOP_COMMON_HOME}/bin/hadoop fs -rm -r -f ${out_dir} \
    && ${HADOOP_COMMON_HOME}/bin/hadoop jar ${examples_jar} wordcount ${in_dir} ${out_dir}
