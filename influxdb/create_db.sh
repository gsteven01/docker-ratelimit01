#exec these commands against the influxdb container.
curl -i -XPOST  'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE jmeter"
curl -i -XPOST  'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE jmeterInfluxDBContainer"
curl -i -XPOST  'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE grafana"
#create db's.
#curl -G http://localhost:8086/query --data-urlencode "q=SHOW DATABASES"
#curl -i -XPOST  'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE jmeter2"
