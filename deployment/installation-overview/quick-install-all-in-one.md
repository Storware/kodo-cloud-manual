# Quick Install \(All-in-One\)

Before you start the installation process you need to prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the [Sizing guide](https://storware.gitbook.io/kodo-for-cloud-office365/overview/sizing-guide) chapter\).

{% hint style="info" %}
Installation on the **RHEL** platform requires an active Red Hat subscription.
{% endhint %}

Before you start the installation process please do the following tasks:

* Add a disk device \(for storing backup data\) to your OS platform.
* Log in as **root** user over **SSH** to the machine you want to install KODO for Cloud server.
* Run `lsblk` command to check the system name for the disk you will use as a storage destination.

```text
[root@localhost ~]# lsblk
NAME              MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                 8:0    0   50G  0 disk
├─sda1              8:1    0  600M  0 part /boot/efi
├─sda2              8:2    0    1G  0 part /boot
└─sda3              8:3    0 18.4G  0 part  
├─vg_os-lv_root 253:0    0 16.4G  0 lvm  /  
└─vg_os-lv_swap 253:1    0    2G  0 lvm  [SWAP]
sdb                 8:16   0  500G  0 disk
sr0                11:0    1  6.7G  0 rom
```

Now the OS platform is ready to deploy KODO for Cloud server. If you plan to use the VDO deduplication option to store backup data, export the following environmental variable:

```text
# export VDO_PHYSICAL_DEVICE=/dev/sdx where x represents the disk letter 
```

Installation on the **RHEL** platform requires an active Red Hat subscription.

To start KODO for Cloud server deployment, copy-and-paste this command and press ENTER:

```text
# bash < <(curl -s http://repo.storware.eu/kodo-cloud/kodo-cloud-local-install.sh)
```

The installation process may take up to 10 minutes, depending on your system performance.

After the installation you can check the KODO server service status by using the following command:

```text
# systemctl status kodo-cloud-server
```

You can also use the command below to check KODO for Cloud server version:

```text
# curl -k https://localhost:8181/api/version# {"value":"4.2.0-17.el8"}
```

If the KODO server is up and running, you should be able to log in to KODO for Cloud using your browser, and the address `https://IP_OF_YOUR_MACHINE:8181`

{% hint style="info" %}
KODO for Cloud server credentials are submitted in the [KodoAdmin vs KODO Organization admin](https://storware.gitbook.io/kodo-for-cloud-office365/overview/sizing-guidehttps://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/kodoadmin-vs-kodo-organization-admin).
{% endhint %}

 You can begin system configuration using information from the [Initial configuration](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration) chapter.

