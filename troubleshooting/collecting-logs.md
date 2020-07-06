# Collecting logs

#### Getting access to the CloudAgent logs

CloudAgent logs contain information about backup and restore operation for Microsoft365. The default name for cloud agent instance is "**voyager**". You can add another instance of cloud agent if your environment needs to be backed up in more efficent way.    

To get logs for troubleshooting do the following:

1. Log in to the system where CloudAgent is installed.
2. Go to directory  **/opt/kodo-cloud/agent/logs/voyager/**
3. Investigate the logs to look for a root cause of errors you've encoutered.

{% hint style="info" %}
If you install another CloudAgent on you Kodo for Cloud server, then the logs path will look as follow: **/opt/kodo-cloud/agent/logs/CloudAgent\_name**
{% endhint %}



If necessary you can download logs using SCP client of your choice \(e.g. WinSCP\).

Server logs are located at the following path:

**/opt/kodo-cloud/server/logs/server/**

You can find two kinds of logs under that path:

* **Server logs** - logs regarding server
* **Application logs** -logs regarding application

