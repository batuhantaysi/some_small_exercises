### SSL Proxy Server Monitor

## Metrics

- All hardware models and specs in case of hardware based problems

- Server uptime

- CPU Load

- CPU Percentage

- CPU heat

- Free space on disk

- Current I/O on disk

- Free space on memory

- Agent or process uptime that is used for monitoring

- Upload and download rates on NICs

- Service status for SSL-Offloader (Nginx or Apache)

- Validation of SSL certificates

- Expire time of SSL certificates

- Signatures of SSL certificates

## Monitoring

1) Using a script works on monitor server

First method is based on a script that connects to the proxy server, runs necessary commands and gets the output of the metrics. Connection can be done via SSH. cronjob can be used for regular monitoring.

2) Using a script works on proxy server

Second method is based on a script that runs the necessary commands on the server and sends the data to the monitoring server. Sending process can be done by rsyslog. 

3) 3rd party platforms - Zabbix, PRTG

The most effective method for system monitoring is using a monitoring service such as Zabbix and PRTG, while Zabbix is much more preferred since It's open source and easy to setup. Zabbix agents are greatly talented for monitoring common metrics, and supports to run scripts for custom metrics on both server-side and client-side.

## Challenges

- Configuring a proper monitoring system that can run 7/24

- Determining proper time range of metric transfer or agent check to avoid possible network bottlenecks

- Determining proper threshold values of metrics to discover anomalies

- Eliminating false-positive alarms

- Configuring triggers for monitoring possible DoS / DDoS / SSL Exhaustion attacks