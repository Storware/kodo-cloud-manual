# Backup destinations

Before you start the installation process you have to configure a data storage device. The KODO for Cloud server can store data on the following devices:

* block devices \(local hard drives, iSCSI or FC drives\)
* NFS share configured on a NAS device: e.g. NetApp or DELL EMC DataDomain.
* Microsoft Azure Blob Storage
* Virtual Data Optimizer \(VDO\)

## Backup destinations overview

If you are going to use a local disk or VDO option to store your data, you have to configure a block device on a server in both cases.

VDO operates at the Linux block layer. This allows delivering benefits to local storage as well as to distributed block, file, or object storage solutions. It works by first eliminating 4KB zero byte blocks and duplicate blocks and then adds compression to the remaining blocks.

The amount of data reduction you will see with VDO will vary depending on the type of data being stored and the workflow that creates and stores the data. Already compressed data types such as video or audio files will not benefit from this technology, but online backups, virtual machines, and container deployments will see substantial benefits. It is not uncommon for users to report 6:1 data reduction rates in the mixed container and VM environments using deduplication and compression technologies such as those provided by VDO.















 





