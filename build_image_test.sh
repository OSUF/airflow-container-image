#!/usr/bin/env bash

AIRFLOW_VERSION="2.3.3"

CMD1=(
    docker build .
    --build-arg PYTHON_BASE_IMAGE="python:3.9-slim-buster"
    --build-arg AIRFLOW_VERSION=$AIRFLOW_VERSION
    --build-arg AIRFLOW_EXTRAS="async,postgres,microsoft.azure,microsoft.mssql,sftp,opsgenie,snowflake,celery,amazon,redis,ldap,odbc"
    --build-arg INSTALL_MYSQL_CLIENT="false"
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="sshpass"
    --tag "airflow-intermediate:test"
    --progress plain
)
CMD2=(
    docker build --file Dockerfile-osuf .
    --build-arg ENV="test"
    --tag "t1lv01k8s.osufoundation.org:32000/airflow:$AIRFLOW_VERSION"
    --progress plain
)
CMD3=(
    docker push t1lv01k8s.osufoundation.org:32000/airflow:$AIRFLOW_VERSION
)

"${CMD1[@]}" && "${CMD2[@]}" && "${CMD3[@]}"