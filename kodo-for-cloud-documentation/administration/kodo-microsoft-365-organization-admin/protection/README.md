# Protection

In this view, you can see all users and SharePoint sites synchronized \(imported\) from the defined organization \(Microsoft 365\)

Click **Synchronize** button to import users or sites from Microsoft 365 organization. Switch to the **Users** view to synchronize users only or switch to the **Sites** view to execute the same action to the Sharepoint sites.

![](https://gblobscdn.gitbook.com/assets%2F-MARp0PEmGx7WatFFC6-%2F-MV2ngxb7L0S9S1nfDLe%2F-MV3168F7INb6X-2iQl3%2FKodo-Cloud%20%20Protection%2001.JPG?alt=media&token=951c09da-5d9f-4e80-81ef-c3f33ebd4532)

You can do the following activities on the protected entities \(users or sites\):

* **Assign** [**Policy**](https://storware.gitbook.io/kodo-for-cloud-office365/administration/policies)**-** to change a data policy for the assigned entities
* ​[**Backup**](https://storware.gitbook.io/kodo-for-cloud-office365/administration/data-backup/on-demand-backup)- to start a backup process for the selected entities
* **Lock/Unlock** -to lock/unlock entities
* **Delete** -to delete selected entities
* ​[**Restore**](https://storware.gitbook.io/kodo-for-cloud-office365/administration/data-restore/restore-data-to-microsoft-365)**-** to store entities data

{% hint style="warning" %}
If an entity is deleted from the server, his status is automatically changed to "**Locked**". The deletion process is running in the background on the server and the backups are removed from the backup storage. When the process is finished, the entity is also removed from the list but not from the Microsoft 365 service. If the entity is preserved in the Microsoft 365 service, the organization admin can synchronize his account with KODO for Cloud server and add it to any defined policy.  
{% endhint %}

