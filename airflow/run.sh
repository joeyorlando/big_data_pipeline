#!/bin/bash

if [ "$1" = "webserver" ]; then
  exec airflow webserver
fi
​
if [ "$1" = "scheduler" ]; then
  exec airflow scheduler
fi
