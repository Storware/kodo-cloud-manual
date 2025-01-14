# Software update

Before every update check installed packages version. Database version is particularly important.

```
# yum info kodo-cloud-server kodo-cloud-agent mariadb-server
# rpm -qa | egrep -e "kodo|Maria"
```

If the host computer has an Internet connection, use the yum command, you'll also see the new package versions provided by the repositories.

### Kodo for Cloud Server update

* Make sure you have Kodo for Cloud database backup.

{% hint style="info" %}
You can find how to backup database in [Disaster Recovery](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodo-organization-admin-guide/settings/disaster-recovery)
{% endhint %}

* If Kodo for Cloud Server was installed on a virtual machine (not a physical one), it would be a good move to take a snapshot
* After backing up the database, we should gently stop the Kodo for Cloud Server service:

```
# systemctl stop kodo-cloud-server
```

* Now you can update your server:

```
# yum -y update kodo-cloud-server
```

* When update is completed, you can start your server:

```
# systemctl start kodo-cloud-server
```

### Kodo for Cloud Agent update

* We recommend to stop the Kodo for Cloud Agents.

```
# systemctl stop cloud-agent-AGENT_NAME
```

* Now you can update your server:

```
# yum -y update kodo-cloud-agent
```

* When update is completed, you can start your agent:

```
# systemctl start cloud-agent-AGENT_NAME
```

