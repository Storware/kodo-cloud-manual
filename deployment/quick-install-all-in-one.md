# Quick Install \(All-In-One\)

KODO for Cloud can be easily installed on a single box. It can be a physical or virtual machine. In both cases, the steps you need to follow are basically the same. Before you start the installation process you need to prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the chapter [Sizing](../planning/sizing/)\).

{% hint style="warning" %}
Installation on the **RHEL** platform requires an active Red Hat subscription.
{% endhint %}

* Log in as **root** user over **SSH** to the machine you want to install KODO for Cloud server.
* If you plan to use the VDO deduplication option to store data, export the following environmental variable

```text
# export VDO_PHYSICAL_DEVICE=/dev/sdx where x represents the disk letter
```

{% hint style="warning" %}
Installation on the **RHEL** platform requires an active Red Hat subscription.
{% endhint %}

* copy-and-paste this command and press ENTER:

```text
# bash < <(curl -s http://repo.storware.eu/kodo-cloud/kodo-cloud-local-install.sh)
```

The installation process may take up to 10 minutes, depending on your system performance.

After the installation you can check the KODO server service status by using the following command:

```text
# systemctl status kodo-cloud-server
● kodo-cloud-server.service - Kodo for Cloud server
   Loaded: loaded (/usr/lib/systemd/system/kodo-cloud-server.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-11-02 15:23:18 CET; 1 day 1h ago
 Main PID: 466653 (java)
    Tasks: 170 (limit: 152594)
   Memory: 3.8G
   CGroup: /system.slice/kodo-cloud-server.service
           └─466653 java -XX:+DisableExplicitGC -XX:+UseG1GC -XX:+UseStringDeduplication -XX:MaxGCPauseMillis=500 -Xmx4g -Xms4g -jar ../lib/kodo-server-api.jar --systemproperties ../config/payara.properties

Nov 02 15:22:43 localhost.localdomain systemd[1]: Starting Kodo for Cloud server...
Nov 02 15:23:18 localhost.localdomain start.sh[466634]: Starting API (pid:466653).............................................................................................................................>
Nov 02 15:23:18 localhost.localdomain start.sh[466634]: API successfully started.
Nov 02 15:23:18 localhost.localdomain systemd[1]: Started Kodo for Cloud server.

```

You can also use the command below to check KODO for Cloud server version:

```text
# curl -k https://localhost:8181/api/version
```

If the KODO service is up and running you should be able to log in to KODO for Cloud using your browser and the address `https://IP_OF_YOUR_MACHINE`

