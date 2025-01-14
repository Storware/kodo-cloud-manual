# Agents

In this menu, you can verify currently configured cloud agent instances on the KODO for Cloud server.

{% hint style="info" %}
One cloud agent instance is installed by default on KODO for Cloud server
{% endhint %}

In the **Options**  menu you can select one of the following options:

* **Details** - information about tasks that were handled by the agent. &#x20;
* **Start/Stop** - you can start (or stop) the agent's instance.
* **Agent config** - you can assign the agent config to the agent.
* **Logs path** - set the path for cloud agent logs.
* **Delete** - choose the option to delete the agent.

![](<../../.gitbook/assets/image (6).png>)

## Cloud agent settings

If you need you can tweak some settings of the cloud agent. You have to log in to the server using SSH protocol and go to the directory `/opt/kodo-cloud/agent/instances/voyager/`&#x20;

You can edit some parameters in the `AgentConfig.json` file, however it's not recommended if you are not asked about it by KODO support.    &#x20;

```
{
  "agent": {
    "name": "tomek",
    "concurrencySize": 5,
    "userAgent": "KODO/4.0",
    "activationCode": "",
    "ArchiveBatchSize": 20,
    "logs": {
      "path": "../../logs/tomek",
      "level": "info",
      "console": true,
      "auditLog": false
    },
    "retries": 5,
    "saveFileToFileSystem": true,
    "jobs": {
      "concurrencySize": 25
    },
    "licensedUsers": true,
    "graphTimeout": {
      "overall": 660,
      "request": 100
    },
    "heartbeatInterval": 180
  },
  "server": {
    "address": "localhost:8181",
    "ignoreCertificate": true
  }
}
```

### Activation key

The activation key is an option for the cloud agent instance to start the agent instance on KODO for Cloud server automatically.

If you want to use this option, you have to configure the cloud agent JSON file and edit the activation key entry.

Do the following steps:

1. Log in as `kodoadmin` user&#x20;
2. Go to the **Agents** menu
3. Click the **Activation secret** button
4. Select and copy the **Cloud Agent activation secret**

![](<../../.gitbook/assets/image (37).png>)

5\.  Log in as `root` user over **SSH** to the KODO for Cloud server.

6\. Go to the folder `/opt/kodo-cloud/agent/instances/agent_name` and edit `AgentConfig.json` file

```
#cd /opt/kodo-cloud/agent/instances/agent_name
#vi AgentConfig.json

{
  "agent": {
    "name": "tomek",
    "concurrencySize": 5,
    "userAgent": "KODO/4.0",
    "activationCode": "",
    "ArchiveBatchSize": 20,
    "logs": {
      "path": "../../logs/tomek",
      "level": "info",
      "console": true,
      "auditLog": false
    },
    "retries": 5,
    "saveFileToFileSystem": true,
    "jobs": {
      "concurrencySize": 25
    },
    "licensedUsers": true,
    "graphTimeout": {
      "overall": 660,
      "request": 100
    },
    "heartbeatInterval": 180
  },
  "server": {
    "address": "localhost:8181",
    "ignoreCertificate": true
  }
}
```

7\. Paste the activation key in the **activationCode** entry under the "server" section (here with an example key value).

```
"activationCode": "KEJvxGx6BMs8Mz5ZK6^ewuamdK%C$Ix-J=GgWQ!e"
```

8\. Save the file.

Go to the[ Tasks ](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodoadmin-user-guide/tasks)section to learn about how to monitor server tasks.
