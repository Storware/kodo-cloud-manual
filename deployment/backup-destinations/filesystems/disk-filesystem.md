# Disk filesystem

In this section, we'll show you how to set up a disk filesystem (it can be a local or remote file system, but this example assumes that you have a dedicated disk that you're going to use as a backup destination with a local XFS file system).

**Note:**

* Any remote FS like **NFS, SMB, etc.** - needs to be mounted by the user and`kodo`user/group must own the directories within the backup destination. KODO for Cloud server expects already mounted file system and mount point in the backup destination.
* you should add this file system to your `/etc/fstab`file, so it gets mounted automatically if OS is rebooted.&#x20;

## Preparation

You also can use a plain file system for staging space (and optionally for backup destination). Here are steps assuming you have a local (physical or virtual) disk.

* Add a disk device to your OS platform (if needed).&#x20;
* Log into KODO for Cloud server as the `root` user
* Run `lsblk` command to check the system name for the disk you will use as the storage destination. &#x20;

```
[root@localhost ~]# lsblk
NAME              MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                 8:0    0   50G  0 disk
├─sda1              8:1    0  600M  0 part /boot/efi
├─sda2              8:2    0    1G  0 part /boot
└─sda3              8:3    0 18.4G  0 part
  ├─vg_os-lv_root 253:0    0 16.4G  0 lvm  /
  └─vg_os-lv_swap 253:1    0    2G  0 lvm  [SWAP]
sdb                 8:16   0  500G  0 disk
sr0                11:0    1  6.7G  0 rom
```

* List all existing disks in your server and find your dedicated disk - in this example - `/dev/sdb` ):

```
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

* Format the disk `dev/sdb`

```
# mkfs.xfs -K /dev/sdb
```

* Add a line to `/etc/fstab` file to automatically mount new  disk after server reboot:

```
/dev/sdb    /kodo_data    xfs    defaults 0 0
```

* Mount the disk device (all filesystems defined in `/etc/fstab` file to be mounted as indicated):&#x20;

```
# mount -a
```

* Confirm with `df` command that your directory `/kodo_data` is mounted
* Create staging space and backup destination directories

```
# mkdir -p /kodo_data/staging
# mkdir -p /kodo_data/backup
# chown -R kodo:kodo /kodo_data/
```

The directories are prepared to store backup data. Now your KODO for Cloud installation is ready for the  [Initial Configuration](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration) section.
