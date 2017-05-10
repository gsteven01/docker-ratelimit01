#API - http://docs.grafana.org/http_api/data_source/
#curl -G http://admin:admin@localhost:3000/api/datasources/:jmeter

curl -H "Content-Type: application/json" -X POST -d '{"name":"influxdb","type":"influxdb","url":"http://localhost:8086","username":"root","password":"root","access":"direct","database":"jmeter"}' http://admin:admin@localhost:3000/api/datasources

curl -H "Content-Type: application/json" -X POST -d '{"name":"jmeterInfluxDBContainer","type":"influxdb","url":"http://localhost:8086","username":"root","password":"root","access":"direct","database":"jmeterInfluxDBContainer"}' http://admin:admin@localhost:3000/api/datasources

curl -H "Content-Type: application/json" -X POST -d '{"name":"grafana","type":"influxdb","url":"http://localhost:8086","username":"root","password":"root","grafanaDB":"true","access":"direct","database":"grafana"}' http://admin:admin@localhost:3000/api/datasources

