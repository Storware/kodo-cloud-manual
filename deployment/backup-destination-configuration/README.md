# Backup destinations

Before you start the KODO for Cloud installation process you have to configure a data storage device. KODO for Cloud server can store data on the following devices:

* block devices \(local hard drives or iSCSI\)
* NFS/SMB share configured on a NAS device: e.g. NetApp or DELL EMC DataDomain.
* Microsoft Azure Blob Storage
* Virtual Data Optimizer \(VDO\)

## Backup destinations overview

If you are going to use a local disk or VDO option to store your data, you have to configure a block device on a server in both cases.

KODO for Cloud requires staging destination configured on a local filesystem. The `/kodo_data/staging`directory is created during the installation process by default. 

Virtua



