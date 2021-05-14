# Platform Requirements

### Operating Systems

KODO for Cloud server supports the following operating system platforms:

#### RedHat Enterprise Linux / CentOS

Minimum version:

* **8.x**

The operating system can be installed either on a physical or a virtual server. The server configuration will depend on the size of your organization in the Microsoft 365 service. Check the [Sizing ](sizing/)section for the requirements for your KODO for Cloud server.  

{% hint style="danger" %}
If KODO for Cloud is to be installed on a virtual machine in VMware vSphere hypervisor in version 6.7 and above, make sure that **Secure Boot** is disabled in the virtual machine's **Boot Options**.
{% endhint %}

{% hint style="warning" %}
Before KODO for Cloud installation, please make sure your OS is up-to-date. Use **dnf update** \(or **yum update**\) command if needed. It's recommended to reboot your OS afterward. 
{% endhint %}

{% hint style="warning" %}
 When you've decided to deploy KODO for Cloud server as a quick install \(All-In-One\) on RHEL 8, it is recommended to have an active Red Hat subscription. This kind of installation uses the ansible-playbook during installation. 

 Use **yum repolist** command to check your subscription status

The [active Red Hat subscription](https://access.redhat.com/management/products) is required for registering the [RHEL 8](https://www.itzgeek.com/tag/rhel-8) systems. You can also [sign up for 30 days trial](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) which will allow you to download Red Hat Enterprise Linux 8 as well as register your RHEL 8 system with Red Hat for receiving packages and updates. 
{% endhint %}

{% hint style="warning" %}
Keep your Red Hat subscription credentials handy for registering your RHEL 8 system to Red Hat.
{% endhint %}

{% hint style="warning" %}
It's recommended to configure separate filesystems for KODO for Cloud server data \(binaries and logs at  /`opt` mount point \) and MariaDB database files \(at /`var/lib` mount point\).  

Use LVM device-mapper as a filesystem, that allows users to expand disk space if necessary.
{% endhint %}

{% hint style="info" %}
TCP **port** 8181 is the standard TCP port ****that is used for website which uses SSL. TCP port 8181 is used to communicate with the KODO for Cloud server UI.
{% endhint %}

Go to the [Multi-tenancy architecture](multitenancy-mode.md) chapter to learn about the assumptions of KODO for Cloud server multi-tenancy architecture.



