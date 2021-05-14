# Agents \(kodoadmin level\)

In this view, you can verify currently configured cloud agent instances on the KODO for Cloud server.

{% hint style="info" %}
One cloud agent instance is installed by default on KODO for Cloud server
{% endhint %}

## Management 

Log in to the server as `kodoadmin` user and go to the **Agents** view. In the **Options**  menu you can select one of the following options:

* **Details** - information about tasks that were handled by the agent.  
* **Start/Stop** - you can start \(or stop\) the agent's instance.
* **Agent config** - you can assign the agent config to the agent.
* **Logs path** - set the path for cloud agent logs.
* **Delete** - choose the option to delete the agent.

![](../.gitbook/assets/image%20%2845%29.png)

## Cloud agent settings

If you need you can tweak some settings of the cloud agent. You have to log in to the server using SSH protocol and go to the directory `/opt/kodo-cloud/agent/instances/voyager/` 

You can edit some parameters in the `AgentConfig.json` file, however it's not recommended if you are not asked about it by KODO support.     

```text
  {
  "agent": {
    "name": "voyager",
    "concurrencySize": 5,
    "userAgent": "KODO/4.0",
    "logs": {
      "path": "../../logs/voyager",
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
    "heartbeatInterval": 180,
    "activationCode": ""
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

1. Log in as `kodoadmin` user 
2. Go to the **Agents** menu
3. Click the **Activation secret** button
4. Select and copy the **Cloud Agent activation secret**

![](../.gitbook/assets/image%20%2856%29.png)

5.  Log in as `root` ****user over **SSH** to the KODO for Cloud server.

6. Go to the folder `/opt/kodo-cloud/agent/instances/agent_name` and edit `AgentConfig.json` file

```text
#cd /opt/kodo-cloud/agent/instances/agent_name
#vi AgentConfig.json

{
  "agent": {
    "name": "voyager",
    "concurrencySize": 5,
    "userAgent": "KODO/4.0",
    "logs": {
      "path": "../../logs/voyager",
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
    "heartbeatInterval": 180,
    "activationCode": ""
  },
  "server": {
    "address": "localhost:8181",
    "ignoreCertificate": true
  }
}

```

7. Paste the activation key in the **activationCode** entry \(here with an example key value\).

8. Save the file.

```text
"activationCode": "KEJvxGx6BMs8Mz5ZK6^ewuamdK%C$Ix-J=GgWQ!e"
```

Go to the [Organizations \(kodoadmin level\)](organizations-kodoadmin-dashboard-only/) chapter to learn about  KODO orgarnizations.

