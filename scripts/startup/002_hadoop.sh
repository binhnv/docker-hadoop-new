#!/usr/bin/env bash

g_dirs="${HD_INIT_DIRS}"
g_service_name="${HD_SERVICE_NAME}"
g_nn_host="${HD_NAMENODE_HOSTNAME}"
hadoop="${HADOOP_PREFIX}/bin/hadoop"
kinit -kt ${KRB_SERVICE_KEYTAB_FILE} hdfs/hadoop@${KRB_DEFAULT_REALM}

function create_dirs {
    local dirs
    local parts

    ${hadoop} fs -mkdir /user /tmp
    ${hadoop} fs -chmod 777 /tmp

    if [[ "${g_dirs}" != "" ]]; then
        dirs=(`echo "${g_dirs}" | tr "," "\n"`)

        for d in "${dirs[@]}"; do
            echo "$d"
            parts=(`echo "${d}" | tr ":" "\n"`)

            ${hadoop} fs -mkdir -p ${parts[0]}
            # the following part does not work yet
            if [[ "${parts[1]}" != "-" ]]; then
                ${hadoop} fs -chown ${parts[1]} ${parts[0]}
            fi
            if [[ "${parts[2]}" != "-" ]]; then
                ${hadoop} fs -chgrp ${parts[2]} ${parts[0]}
            fi
            if [[ "${parts[3]}" != "-" ]]; then
                ${hadoop} fs -chmod ${parts[3]} ${parts[0]}
            fi
        done
    fi
}

function main {
    my_tcp_wait ${g_nn_host} 9000
    create_dirs
    my_service "register" ${g_service_name}
}

main "$@"
