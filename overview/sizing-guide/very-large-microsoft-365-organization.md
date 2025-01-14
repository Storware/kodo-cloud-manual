# Very Large Microsoft 365 organization

For a very large Microsoft 365 organization (1000+ users) the following system configuration is recommended:

| Component      | OS platform requirements                                                                                                                                                                                                                                                                                                                                    |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Kodo for Cloud | <ul><li>at least 8 cores</li><li>at least 32 GB RAM</li><li>at least 30 GB free space for operating system binaries</li><li>at least 500 GB free space for database (<strong>/var/lib/mysql</strong> directory)</li><li>at least 30 GB free space for KODO software (<strong>/opt/kodo-cloud</strong> directory)</li><li>storage space for backup</li></ul> |

The storage space required to store backup data depends on the amount of data your organization is currently utilizing plus some overhead for the future data increase.

{% hint style="info" %}
You can check the current storage usage of your Microsoft 365 organization by log in to the following URL as the administrator user of your organization:

​[https://admin.microsoft.com/Adminportal/Home/#/reportsUsage](https://admin.microsoft.com/Adminportal/Home/#/reportsUsage)​

It's recommended to configure all disks as LVM devices just to be able to extend their capacity if needed.
{% endhint %}

Go to the [Deployment](https://storware.gitbook.io/kodo-for-cloud-office365/deployment) chapter to choose KODO for Cloud server installation type or go to the [Licensing](../licensing.md) section to learn how KODO for Cloud is licensed.
