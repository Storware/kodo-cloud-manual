# Cloud Agent

Another instance of Cloud Agent allows you to run next 25 tasks in parallel on your KODO for Cloud server.

If you need to install it do as follow:

1. Register agent to the server with `AGENT_NAME` of your choice, to the server `ADMIN_USER` user name which you would like to use and URL to Kodo for Cloud API and provide password when prompted.
   * syntax:

```text
/opt/kodo-cloud/agent/bin/cloudagent.sh -s SERVER_HOST:SERVER_PORT -n AGENT_NAME
```

{% hint style="info" %}
currently only local installation is supported, so you should use localhost and 8181 as the target:
{% endhint %}

```text
/opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager2
[root@localhost ~]# /opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager2
Created symlink /etc/systemd/system/multi-user.target.wants/cloud-agent-voyager2.service → /usr/lib/systemd/system/cloud-agent-voyager2.service.

Agent name: voyager2
Kodo Cloud Serer address: localhost:8181
Job concurrency size: 25
```

2. Start and enable Kodo Cloud Agent service \(provide the agent name\).

* syntax:

  ```text
  systemctl start cloud-agent-AGENT_NAME
  systemctl enable cloud-agent-AGENT_NAME
  ```

* example:

  ```text
  systemctl start cloud-agent-voyager2
  systemctl enable cloud-agent-voyager2
  ```

3. Now you should be able to see new entry in `Agents` section of web UI \([kodoadmin ](../../administration/dashboard.md)dashboard\)







