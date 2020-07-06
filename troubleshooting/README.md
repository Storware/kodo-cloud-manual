# Troubleshooting

To verify if services are running you can use:

* `systemctl status kodo-cloud-server` for verify Server status
* `systemctl status cloud-agent-voyager`for verify CloudAgent status

If you need to restart, stop or start KODO for Cloud server service, do as follow:

* `systemctl restart kodo-cloud-server` for Server restart
* `systemctl restart cloud-agent-voyager`for CloudAgent restart

adn use the **start** and **stop** parameter respectively to trigger the action.  

#### Getting access to the CloudAgent logs

CloudAgent logs contain information about backup and restore operation for Microsoft365. The default name for cloud agent instance is "**voyager**". You can add another instance of cloud agent if your evnironment needs to be backed up in more efficent way.    

To get logs for troubleshooting do the following:

1. Log in to the system where CloudAgent is installed.
2. Go to directory  **/opt/kodo-cloud/agent/logs/voyager/**
3. Investigate the logs to look for a root cause of errors you've encoutered.

{% hint style="info" %}
If you install another CloudAgent on you Kodo for Cloud server, then the path for logs will look as follow: **/opt/kodo-cloud/agent/logs/CloudAgent\_name**
{% endhint %}

If necessary you can download logs using SCP client of your choice \(e.g. WinSCP\).

Server logs are located at the following path:

**/opt/kodo-cloud/server/logs/server/**

Under that path you can find two kinds of logs:

* **Server logs** - logs regarding server
* **Application logs** -logs regarding application

CLI interface records messages in `vprotect_client.log` files under the subdirectory with the same name as the node. In the same directory you can also find `vprotect_daemon.log` files which contains all engine related messages.

Web UI has 2 directories where it stores log files:

* `appserver` which has all messages coming from application server - which hosts web UI and API
* `api` which has all messages related to - core vProtect Server application
* 
If you don't find here root cause of the problem you can switch vProtect to [DEBUG mode](), and recreate task to generate log's in DEBUG mode.

