# Cloud Agent

Cloud agent is a part of KODO for Cloud server that is responsible for backup and recovery of users data.

When KODO for Cloud server is installed, only one instance of cloud agent is deployed by default. 

{% hint style="info" %}
One instance of cloud agent is capable to run 25 tasks in parallel by default. If you need to configure another Cloud Agent instance you have to add an additional 4GB of RAM and 2 cores into your system configuration.
{% endhint %}

If you need to install the Cloud Agent instance do as follow:

1. Register agent to the server with `AGENT_NAME` of your choice to the server `SERVER_HOST`
   * syntax:

```text
#/opt/kodo-cloud/agent/bin/cloudagent.sh -s SERVER_HOST:SERVER_PORT -n AGENT_NAME
```

* example \(AGENT\_NAME=voyager2\):

```text
#/opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager2
[root@localhost ~]# /opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager2
Created symlink /etc/systemd/system/multi-user.target.wants/cloud-agent-voyager2.service → /usr/lib/systemd/system/cloud-agent-voyager2.service.

Agent name: voyager2
Kodo Cloud Serer address: localhost:8181
Job concurrency size: 25
```

2. Start and enable Kodo Cloud Agent service \(provide the agent name\).

* syntax:

```text
#systemctl start cloud-agent-AGENT_NAME
#systemctl enable cloud-agent-AGENT_NAME
```

* example \(AGENT\_NAME=voyager2\):

```text
#systemctl start cloud-agent-voyager2
#systemctl enable cloud-agent-voyager2
```

3. Now you should be able to see the new entry in `Agents` section of web UI \([kodoadmin ](../administration/dashboard.md)dashboard\)

