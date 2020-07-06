# Quick Install \(All-In-One\)

KODO for Cloud can be easily installed on a single box quickly. You just need a few steps:

* Install **CentOS or RHEL 8** **minimal** with **4 GB** of RAM and **2 vCPUs** and some storage for staging space and optionally a backup destination:
  * use the first disk for an operating system
  * add a secondary disk, i.e. **200GB - 1 TB** \(depending on the size your VMs that you want to backup\) - leave it empty, you'll initialize this space later
* log in as **root** over **SSH** to your machine, where you want to install it
* **RHEL** requires an active subscription
* Optionally, if you want to have initialize VDO \(deduplication\) initialized during installation, please do a following steps
  * add a physical or virtual disk to KODO server
  * check it availability - `lsblk` command - let's assume it is `/dev/sdx`
  * before running the install script export an environment variable`export VDO_PHYSICAL_DEVICE=/dev/sdx` where x represents the disk
  * it will initialize deduplicated storage in `/kodo_data` which contains both staging space and backup destination
* copy-and-paste this command and press ENTER:

  ```text
  bash < <(curl -s http://repo.storware.eu/kodo-cloud/kodo-cloud-local-install.sh)
  ```

Now you should be able to log in to vProtect Server using `https://IP_OF_YOUR_MACHINE` with local node registered and running. 

By default Kodo Cloud has one global admin \(admin managing organizations\) account and a account in the default organization:

* Kodo admin \(global admin\): `kodoadmin` with password `Kodo@dm1n` \(with zero\)
* default organization admin: `admin` with password `Kodo@dm1n` \(with zero\)



