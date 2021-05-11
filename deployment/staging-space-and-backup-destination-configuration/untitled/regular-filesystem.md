# Regular filesystem

In this section, we'll show you how to set up a  file system \(it can be a local or remote file system, but this example assumes that you have a dedicated disk that you're going to use as a backup destination with a local XFS file system\)

**Note:**

* Any remote FS like **NFS, SMB, etc.** - needs to be mounted by the user and `kodo` user/group must own the directories within the backup destination. KODO for Cloud server expects already mounted file system and mount point in the backup destination
* you should add this file system to your `/etc/fstab` file, so it gets mounted automatically if OS is rebooted 

## Preparation

You also can use a plain file system for staging space \(and optionally for backup destination\). Here are steps assuming you have a local \(physical or virtual\) disk.

* Logi into KODO for Cloud server as the `root` user
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



