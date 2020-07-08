# Platform Requirements

## Platform Requirements

The KODO for Cloud server is supported on the CentOS 8.x or RHEL 8.x operating system.  The operating system can be install on a physical or a virtual server. The server configuration will depend on the size of your organization in the Microsoft 365 service. Check the [Sizing ](sizing/)section for the requirements for your KODO for Cloud server.  

{% hint style="warning" %}
Before the KODO for Cloud installation, please make sure your OS is up-to-date. Use **dnf update** \(or **yum update**\) command if needed. Reboot your OS afterwards. 
{% endhint %}

{% hint style="warning" %}
 When you've decided to deploy the KODO for Cloud server as quick install \(All-In-One\) on RHEL 8, it is recomended to have active Red Hat subscription. This kind of installation uses the ansible-playbook during installation. 

 Use **yum repolist** command to check you subscription status

An [active Red Hat subscription](https://access.redhat.com/management/products) is required for registering the [RHEL 8](https://www.itzgeek.com/tag/rhel-8) systems or you can [sign up for 30 days trial](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) which will allow you to download Red Hat Enterprise Linux 8 as well as register your RHEL 8 system with Red Hat for receiving packages and updates.
{% endhint %}

Keep your Red Hat subscription credentials handy for registering your RHEL 8 system to Red Hat.

{% hint style="info" %}
 TCP **port 443** is the standard TCP port ****that is used for website which use SSL. TCP port 443 is used to communicate with the KODO for Cloud server UI.
{% endhint %}







