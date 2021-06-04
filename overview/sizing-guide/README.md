# Sizing Guide

In this chapter, we have gathered general tips and hints you may find useful when thinking about implementing **KODO for Cloud**.

Before you start KODO for Cloud installation, find the answers to the following questions:

1. **What?**
   * What type of Microsoft 365 services you want to protect?
   * How big is the volume of your data? 
   * How many user accounts are used in your Microsoft 365 organization?
2. **Where?**
   * Where will you store your backups? Are you going to use a standard filesystem \(like xfs or ext4\), NFS/SMB share or you prefer to leverage Microsoft Azure Blob Storage?  
3. **When?**
   * What is the best time to take backups?  It is almost certain that throttling may occur during the backup task. Throttling limits the number of concurrent calls to a service to prevent the overuse of resources. Microsoft Graph is designed to handle a high volume of requests. If an overwhelming number of requests occurs, throttling helps maintain optimal performance and reliability of the Microsoft Graph service. It's recommended to schedule your Microsoft organization backup after normal working hours to avoid throttling occurrences.

{% hint style="warning" %}
The storage space required to store backup data will be depending on the amount of data your organization is utilizing now, plus some overhead for the future data increase. It's recommended to add at least 30% of storage disk space overhead.
{% endhint %}

{% hint style="info" %}
You can check the current storage usage of your Microsoft 365 organization by log in to the following URL as the administrator user of your organization:

​[https://admin.microsoft.com/Adminportal/Home/\#/reportsUsage](https://admin.microsoft.com/Adminportal/Home/#/reportsUsage)​
{% endhint %}

{% hint style="info" %}
All KODO for Cloud components can be installed on one filesystem, but it's recommended to create separate mount points for **/var/lib/mysql** and **/opt/kodo-cloud** filesystems.

Configure all disks as LVM devices just to extend their capacity in the future if needed.
{% endhint %}

Based on the best practise, we prepared four configurations that are typical for most use cases. 

Browse the next chapters and find the right system configuration that fits your Microsoft 365 organization size.

