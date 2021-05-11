# Architecture

## High-level architecture

Use KODO for Cloud to back up and restore your data from your Microsoft 365. You can back up data to and recover data from the local filesystem, Virtual Data Optimizer \(VDO\), Azure Blog Storage, Gluster FS, CephFS, NFS/CIFS share, and Data Domain deduplicator.

![](../.gitbook/assets/kfc_architecture_2021_transparent.png)

## Detailed architecture

![](../.gitbook/assets/kodo-for-cloud-detailed-architecture.png)



KODO for Cloud consists of 2 main components:

* **KODO server \(API-core\)** - the central point of management, provides administrative Web UI, APIs and is a central repository of metadata.
* **KODO cloud agent** - data mover that performs backups and restores :
  * it retrieves Microsoft 365 items from the cloud and stores them locally \(on local disk,  NFS share, and Azure Blob Storage\)
  * during the restore process, it sends data back to Microsoft 365 service, or data can be recovered locally
  * cloud agent can be multiplied for better backup/restore performance

## Component placement

* KODO for Cloud server and cloud agent can be installed on the same system. 
* The server can be installed on a physical or a virtual machine.
* The agent can be installed on a separate system if needed.
* The agent may be installed during KODO for Cloud server installation \(see the chapter  [Quick Install \(All-In-One\)](../deployment/quick-install-all-in-one.md)\).
* Both components are installed on the CentOS/RHEL 8 minimal.

On KODO for Cloud server the following components are also configured:

#### KODO database \(MariaDB\) 

* KODO database \(backup catalog\) for keeping all metadata of protected users' data is configured in MariaDB. 

#### Backup Storage

* It's a storage destination where KODO for Cloud server stores backup data.

