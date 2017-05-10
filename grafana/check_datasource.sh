#/bin/bash

curl -G http://admin:admin@localhost:3000/api/datasources/:jmeter
curl -G http://admin:admin@localhost:3000/api/datasources/:grafana

