# Backup destinations

Before you start the installation process you have to configure a data storage device. KODO for Cloud server can store data on the following devices:

* block devices \(local hard drives, iSCSI or FC drives\)
* NFS share configured on a NAS device: e.g. NetApp or DELL EMC DataDomain.
* Microsoft Azure Blob Storage
* Virtual Data Optimizer \(VDO\)

## Backup destinations overview

If you are going to use a local disk or VDO option to store your data, you have to configure a block device on a server in both cases.



KODO for Cloud requires staging destination configured on a local filesystem. The `/kodo_data/staging`directory is created during the installation process by default. 

## 

## Preparing a file system

You also can use a plain file system for staging space \(and optionally for backup destination\). Here are steps assuming you have a local \(physical or virtual\) disk.

* List all existing disks in your server and find your dedicated disk - in this example - `/dev/sdb` \(use `/dev/mapper/kodo` instead of `/dev/sdb` if VDO is used\):

  ```text
  [root@localhost ~]# fdisk -l |grep dev
  Disk /dev/sdb: 500 GiB, 536870912000 bytes, 1048576000 sectors
  Disk /dev/sda: 50 GiB, 53687091200 bytes, 104857600 sectors
  /dev/sda1     2048  1230847  1228800  600M EFI System
  /dev/sda2  1230848  3327999  2097152    1G Linux filesystem
  /dev/sda3  3328000 41940991 38612992 18.4G Linux LVM
  Disk /dev/mapper/vg_os-lv_root: 16.4 GiB, 17620271104 bytes, 34414592 sectors
  Disk /dev/mapper/vg_os-lv_swap: 2 GiB, 2147483648 bytes, 4194304 sectors
  Disk /dev/mapper/kodo: 1.5 TiB, 1610612736000 bytes, 393216000 sectors
  ```

* Format the disk \(use `/dev/sdb` or `/dev/mapper/kodo` if VDO is used\)

  ```text
  # mkfs.xfs -K /dev/sdb
  ```

* Add a line to `/etc/fstab` file to automatically mount new  disk after server reboot

  * if the plain block device is used:

  ```text
  /dev/sdb    /kodo_data    xfs    defaults 0 0
  ```

  * if VDO is used add the following line:

  ```text
  /dev/mapper/kodo    /kodo_data   xfs   defaults,discard,x-systemd.requires=vdo.service 0 0
  ```

* Mount the disk device \(all filesystems mentioned in `/etc/fstab` file to be mounted as indicated\): 

  ```text
  # mount -a
  ```

* Confirm with `df` command that your directory `/kodo_data` is mounted
* Create staging space and backup destination directories

  ```text
  # mkdir -p /kodo_data/staging
  # mkdir -p /kodo_data/backup
  ```



