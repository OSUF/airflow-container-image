#!/usr/bin/env bash
CMD1=(
    docker build .
    --build-arg PYTHON_BASE_IMAGE="python:3.9-slim-buster"
    --build-arg AIRFLOW_VERSION="2.2.5"
    --build-arg AIRFLOW_EXTRAS="async,grpc,postgres,statsd,microsoft.azure,microsoft.mssql,sftp,opsgenie,cncf.kubernetes,snowflake,celery,amazon,redis,ldap"
    --build-arg INSTALL_MYSQL_CLIENT="false"
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="sshpass"
    --tag "airflow-intermediate:latest"
)
CMD2=(
    docker build --file Dockerfile-osuf .
    --build-arg ENV="latest"
    --tag "osufcontainerregistry.azurecr.io/airflow:latest"
)

"${CMD1[@]}" && "${CMD2[@]}" 