# Quick Install \(All-In-One\)

KODO for Cloud can be easily installed on a single box. It can be a physical server or a virtual one.  In both cases, the steps you need to follow are basically the same. 

* Install **CentOS 8** or **RHEL 8** **minimal** with **16 GB** of RAM and **4 vCPUs**  \(or 2 physical CPUs\) and some storage for staging and  backup destination:
  * use the first disk for an operating system \(50 GB recommended\)
  * use another disk for /opt/kodo-cloud disrectory
  * add a secondary disk, i.e. **200GB - 1 TB** \(depending on the size your VMs that you want to backup\) - leave it empty, you'll initialize this space later
  * make sure to have valid subscription if RHEL is your OS
* Log in as **root** over **SSH** to the machine you want to install it.

{% hint style="warning" %}
* **RHEL** requires an active subscription
{% endhint %}

* Optionally, if you want to have initialize VDO \(deduplication\) initialized during installation, please do a following steps
  * add a physical or virtual disk to KODO server
  * check its availability - `lsblk` command - let's assume it is `/dev/sdx`
  * before running the install script export an environment variable`export VDO_PHYSICAL_DEVICE=/dev/sdx` where x represents the disk
  * it will initialize deduplicated storage in `/kodo_data` which contains both staging space and backup destination
* copy-and-paste this command and press ENTER:

  ```text
  bash < <(curl -s http://repo.storware.eu/kodo-cloud/kodo-cloud-local-install.sh)
  ```

Now you should be able to log in to KODO for Cloud using `https://IP_OF_YOUR_MACHINE` with local node registered and running. 

By default Kodo for Cloud has one global admin \(admin managing organizations\) account and a account in the default organization:

* Kodo admin \(global admin\): `kodoadmin` with password `Kodo@dm1n` 
* default organization admin: `admin` with password `Kodo@dm1n` 



