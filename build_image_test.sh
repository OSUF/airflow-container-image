#!/usr/bin/env bash
CMD1=(
    docker build .
    --build-arg PYTHON_BASE_IMAGE="python:3.10-slim-buster"
    --build-arg AIRFLOW_VERSION="2.3.0"
    --build-arg AIRFLOW_EXTRAS="async,grpc,postgres,statsd,microsoft.azure,microsoft.mssql,sftp,opsgenie,cncf.kubernetes,snowflake,celery,amazon,redis,ldap"
    --build-arg INSTALL_MYSQL_CLIENT="false"
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="sshpass"
    # --tag "osufcontainerregistry.azurecr.io/airflow:latest"
    --tag "airflow-intermediate:test"
)
CMD2=(
    docker build --file Dockerfile-osuf .
    --tag "osufcontainerregistry.azurecr.io/airflow:test"
)

"${CMD1[@]}" && "${CMD2[@]}" 