#Rate limit POC with Jmeter and pretty visualisation.  garry.stevens@cancer.org.uk   10/05/17

#Kudos To:
- Sébastien Portebois for his write up on nginx rate limiting and providing the nginx sandbox.
- NovaTecConsulting for their dank jmeter plugin https://github.com/NovaTecConsulting/JMeter-InfluxDB-Writer/releases
- Creators/Maintainers of apache-jmeter, grafana, nginx, docker,influxdb. 
- Anyone elses stuff / info I used to achieve this stack.
- Apologies for any typo.

#Please note - this was completed in a very short peroid of time with no prior knowledge to some of the products - This should only be used for evaluation / testing purposes not in production.

#As of writing these notes this stack as code is 172kb in size - pretty neat.


#What?

A small stack to test/model nginx rate limiting with realtime metric visualisation, see roles below. 

nginx - web server configured to rate limiting traffic based on uri and ip address using mod ngx_http_limit_req_module example settings are configured to rate limit per sec with burst queue and nodelay options.  

jmeter config - (in jmeter dir) a very basic jmeter config to generate traffic to specfic rate limited uri's using a backend listener and send measurements to influxdb. (a bit messy and includes stuff not needed - please do extend and tidy up as needed.)

influxdb - db to store series measurements.

grafana - grafana/graphite setup to create datasources and front end visualization for measurments. 


#Why?

We are evaluating the use of rate limiting to protect the health of our applications.  This stack includes various uris that are setup to restrict traffic based on either uri or ip.

The methods used are both leaky bucket and token based.


Test behaviour of rate limiting - monitor burst abiltiy / queuing and choke points / error count.

Also, ..get a basic understanding of jmeter, docker , grafana and influxdb.


#How?

./run.sh or docker-compose up to start the stack

./run-once to setup db's and datasources.

docker-compose stop to stop the stack.

docker-compose down to delete the stack

#Initial setup.

#After starting the stack and executing the run-once.sh script.


Browse to localhost:3000/login   (both the username and password is admin)

In the grafana admin panel use the left hand nav and goto 'Dashboards' -> Import

On the import page paste the number '1152' into the 'Grafana.net Dashboard' field and press load.  This number is the ref num for jmeter plugin for grafana. 

This will load the plugin config page.  Under options select the source 'jmeterInfluxDBContainer'

Click import.

In the top right hand corner on the new dashboard set the time to last 3 hours.


#Jmeter setup.

#Download jmeter 
http://apache.mirrors.nublue.co.uk//jmeter/binaries/apache-jmeter-3.2.tgz

#Download the Backend Listener plugin for grafana.
https://github.com/NovaTecConsulting/JMeter-InfluxDB-Writer/releases

paste the jar into the /lib/ext directory of your JMeter installation. (Then Restart JMeter)

Open the example jmeter script in the jmeter/example-test/ dir.  Your backend listener should look something like this.

<<
testName        nginx-ratelimt
influxDBHost    localhost
influxDBPort    8086
influxDBUser    root
influxDBPassword        root
influxDBDatabase        jmeterInfluxDBContainer
retentionPolicy autogen
samplersList    .*
>>


#Additional notes:

#To have a poke around in the db you can fire up another influx db node and use the client.
docker run --rm --link=influxdb -it influxdb influx -host influxdb

#The nginx config for rate limiting is in the nginx/conf.d folder. 

#to restart nginx you can simply inject the command into the continer.

#see a very good explaination of nginx rate limiting below - this article inspired me to build this stack in docker with added visualisaiton - the author also maintains the nginx docker image used in this stack.
https://medium.freecodecamp.com/nginx-rate-limiting-in-a-nutshell-128fe9e0126c



#TODO. 
Automate the lot including creation of db, datasource and dashboards etc.

Include jmeter container and ability to run tests from cmd line.

