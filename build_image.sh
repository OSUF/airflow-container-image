#!/usr/bin/env bash
CMD=(
    docker build .
    --build-arg PYTHON_BASE_IMAGE="python:3.9-slim-buster"
    --build-arg AIRFLOW_VERSION="2.2.4"
    --build-arg AIRFLOW_EXTRAS="async,grpc,postgres,statsd,microsoft.azure,microsoft.mssql,sftp,opsgenie,cncf.kubernetes,snowflake,celery,amazon,redis,ldap"
    --build-arg INSTALL_MYSQL_CLIENT="false"
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="sshpass"
    --tag "osufcontainerregistry.azurecr.io/airflow:latest"
)

"${CMD[@]}"