# Quick Install \(All-In-One\)

KODO for Cloud can be easily installed on a single box. It can be a physical or a virtual machine. In both cases, the steps you need to follow are basically the same. Before you start the installation process you need to prepare your server platform accordingly to the size of Microsoft 365 organization you are going to protect \(see the chapter [Sizing](../planning/sizing/)\).

{% hint style="warning" %}
Installtion on **RHEL** platform requires an active Red Hat subscription.
{% endhint %}

* Log in as **root** user over **SSH** to the machine you want to install KODO for Cloud server.
* If you plan tu use VDO deduplication option to store data, export the following environmantal variable

```text
export VDO_PHYSICAL_DEVICE=/dev/sdx where x represents the disk letter
```

{% hint style="warning" %}
Installation on **RHEL** platform requires an active Red Hat subscription.
{% endhint %}

* copy-and-paste this command and press ENTER:

```text
bash < <(curl -s http://repo.storware.eu/kodo-cloud/kodo-cloud-local-install.sh)
```

Installation process may take about 2-5 minutes, depending on your system performance.

Now you should be able to log in to KODO for Cloud using `https://IP_OF_YOUR_MACHINE`

