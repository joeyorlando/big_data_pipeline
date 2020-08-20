# https://levelup.gitconnected.com/deploying-scalable-production-ready-airflow-in-10-easy-steps-using-kubernetes-4f449d01f47a
# https://airflow.apache.org/docs/stable/installation.html
FROM python:3.8.2

USER root
RUN apt-get update && apt-get --yes install \
    supervisor \
    sudo \
    git \
    vim \
    cron \
    gcc

RUN pip install \
    apache-airflow==1.10.11 \
    --constraint \
    https://raw.githubusercontent.com/apache/airflow/1.10.11/requirements/requirements-python3.8.txt

RUN cd /usr/local && mkdir airflow && cd airflow

RUN useradd -ms /bin/bash airflow
RUN usermod -a -G sudo airflow
RUN chmod 666 -R /usr/local/airflow

ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

COPY run.sh /run.sh 

EXPOSE 8080
ENTRYPOINT [ "/run.sh" ]
