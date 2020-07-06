# Troubleshooting

To verify if services are running you can use:

* `systemctl status kodo-cloud-server` for verify Server status
* `systemctl status cloud-agent-voyager`for verify CloudAgent status

If you need to restart, stop or start KODO for Cloud server service, do as follow:

* `systemctl restart kodo-cloud-server` for Server restart
* `systemctl restart cloud-agent-voyager`for CloudAgent restart

and use the **start** and **stop** parameter respectively to trigger the action.  

#### 

Web UI has 2 directories where it stores log files:

* `appserver` which has all messages coming from application server - which hosts web UI and API
* `api` which has all messages related to - core vProtect Server application
* 
If you don't find here root cause of the problem you can switch vProtect to [DEBUG mode](), and recreate task to generate log's in DEBUG mode.

