#!/usr/bin/env bash
CMD1=(
    docker build .
    --build-arg PYTHON_BASE_IMAGE="python:3.9-slim-buster"
    --build-arg AIRFLOW_VERSION="2.3.0"
    --build-arg AIRFLOW_EXTRAS="async,postgres,microsoft.azure,microsoft.mssql,sftp,opsgenie,snowflake,celery,amazon,redis,ldap"
    --build-arg INSTALL_MYSQL_CLIENT="false"
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="sshpass"
    --tag "airflow-intermediate:test"
)
CMD2=(
    docker build --file Dockerfile-osuf .
    --build-arg ENV="test"
    --tag "osufcontainerregistry.azurecr.io/airflow:test"
)

"${CMD1[@]}" && "${CMD2[@]}" 