# Large Microsoft 365 organization

Large Microsoft 365 organization

For a large Microsoft 365 organization (from 251 to 1000 users) the following system configuration is recommended:

| Component      | OS platform requirements                                                                                                                                                                                                                                                                                                                                    |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Kodo for Cloud | <ul><li>at least 4 cores</li><li>at least 24 GB RAM</li><li>at least 30 GB free space for operating system binaries</li><li>at least 275 GB free space for database (<strong>/var/lib/mysql</strong> directory)</li><li>at least 25 GB free space for KODO software (<strong>/opt/kodo-cloud</strong> directory)</li><li>storage space for backup</li></ul> |

The storage space required to store backup data depends on the amount of data your organization is currently utilizing plus some overhead for the future data increase.

You can check the current storage usage of your Microsoft 365 organization by log in to the following URL as the administrator user of your organization:

​[https://admin.microsoft.com/Adminportal/Home/#/reportsUsage](https://admin.microsoft.com/Adminportal/Home/#/reportsUsage)​

It's recommended to configure all disks as LVM devices just to be able to extend their capacity if needed.

Go to the [Deployment](https://storware.gitbook.io/kodo-for-cloud-office365/deployment) chapter to choose KODO for Cloud server installation type or go to the [Very large Microsoft 365 organization](https://storware.gitbook.io/kodo-for-cloud-office365/overview/sizing-guide/very-large-microsoft-365-organization) section.
