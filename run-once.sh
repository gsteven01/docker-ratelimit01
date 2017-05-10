#!/bin/bash

echo "creating databases"
./influxdb/create_db.sh

echo "creating datasources"
./grafana/create_datasource.sh

#echo "checking databases"
#./influxdb/check_db.sh

#echo "checking datasources"
#./check_datasource.sh
