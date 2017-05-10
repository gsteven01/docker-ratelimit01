#/bin/bash
#docker run --rm --link=influxdb -it influxdb influx -host influxdb
curl -G http://localhost:8086/query --data-urlencode "q=SHOW DATABASES"
