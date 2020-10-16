# Backup Storage

Before you start the installation process you have to configure a data storage device. The KODO for Cloud server can store data on the following devices:

* block devices \(hard drives, SSD drives\)
* NFS share \(configured on a NAS device \(e.g. NetApp or DELLEMC  DataDomain\)\)

## Backup Storage overview

If you are going to use a local disk or VDO option to store your data, you have to configure a block device on server in both cases.

VDO operates at the Linux block layer. This allows it to deliver benefits to local storage as well as todistributed block, file, or object storage solutions. It works by first eliminating 4KB zero byte blocks and duplicate blocks and then adds compression to the remaining blocks.

The amount of data reduction you will see with VDO will vary depending on the type of data being stored and the workflow that creates and stores the data. Already compressed data types such as video or audio files will not benefit from this technology, but online backups, virtual machine, and container deployments will see substantial benefits. It is not uncommon for users to report 6:1 data reduction rates in mixed container and VM environments using deduplication and compression technologies such as those provided by VDO.

Good candidates for VDO are:

* Backups
* Virtual desktops
* Virtual servers
* Containers
* Shared home directories











 





