# Users

In this view, you can see all users synchronized \(imported\) from a defined organization \(Microsoft 365\)

Click **Synchronize** button to import users from defMicrosoft 365 organization.

![](../.gitbook/assets/kodo-cloud-administration-users01%20%281%29.png)

You can do the following activities on the user\(s\):

* Assign [Policy](policies/)- change a data policy  for assigned user\(s\)  
* [Backup](data-backup/on-demand-backup.md)- start a backup process for selected user\(s\)
* Lock/Unlock -lock/unlock user\(s\)
* Delete -delete selected user\(s\)
* [Restore](data-restore/restore-data-to-microsoft-365.md)-restore users\(s\) data

![](../.gitbook/assets/kodo-cloud-administration-users02.png)

{% hint style="warning" %}
If a user was deleted from the server, his status is automatically changed to "Locked". The deletion process is running in the background on the server and the backups are removed from the backup storage. When the process is finished, the user is also removed from the users list but not from the Microsoft 365 service. If the user is preserved in the Microsoft 365 service,  organization admin can synchronize his account with KODO for Cloud server and add it to any defined policy.  
{% endhint %}



