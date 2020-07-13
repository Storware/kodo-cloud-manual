# Backup Storage

Before you start the installation process you have to configure a data storage device. The KODO for Cloud server can store data on the following devices:

* block devices \(hard drives, SSD drives\)
* NFS share \(configured on a NAS device \(e.g. NetApp or DELLEMC  DataDomain\)\)

## Backup Storage overview

If you are going to use a local disk or VDO option to store your data, you have to configure a block device on server in both cases.

VDO data reduction technology works at the OS layer so it can benefit all layers above it. It works by first eliminating 4KB zero byte blocks and duplicate blocks and then adds compression to the remaining blocks.







 





