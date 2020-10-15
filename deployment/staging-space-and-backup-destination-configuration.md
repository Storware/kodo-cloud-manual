# Backup and staging space configuration

KODO for Cloud needs staging and backup destination  in `/kodo_data` directory by default. We suggest to  attach just empty drive and then configure it.

You can configure a storage space as VDO device or a block device on the OS filesystem layer.

## Deduplication \(VDO- Virtual Data Optimizer\) setup

 VDO is the software that provides inline block-level **deduplication**, compression, and thin provisioning capabilities for primary storage.

If you plan to use VDO deduplication for storing you backups, do as follow: 

* Add a disk device to your OS platform. 
* Run `lsblk` command to check the system name for the disk you will use as storage destination.  

```text
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

* Install VDO device-mapper driver

```text
yum -y install vdo
```

* Reboot your OS platform to load VDO into system kernel. Run `lsmod |grep vdo` command to make sure the vdo is loaded. 

```text
[root@localhost ~]# lsmod |grep vdo
kvdo                  581632  1
uds                   253952  1 kvdo
dm_mod                151552  13 kvdo,dm_log,dm_mirror,dm_bufio
```

* Start and enable VDO device mapper

```text
systemctl start vdo
systemctl enable vdo
```

* Create VDO device on top of your physical block device:
  * let's assume it is `/dev/sdb`
  * we estimate by default the logical size of the VDO device to be 3 times the size of your physical device, so in this example, for 1 TB physical size, we can try with 3 TB logical size
  * if the block device is larger than 16 TB, add the `--vdoSlabSize=32G` parameter at the end to increase the slab size on the volume to 32 GB.

```text
vdo create --name=kodo --device=/dev/sdb --vdoLogicalSize=3T
```

* Now proceed with steps described in **Preparing file system** section below - use block device name `/dev/sdb`  or  `/dev/mapper/kodo` if VDO is used.

## Preparing file system

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
  mkfs.xfs -K /dev/sdb
  ```

* Add a line to `/etc/fstab` file to automatically mount new  disk after server reboot

  * if plain block device is used:

  ```text
  /dev/sdb    /kodo_data    xfs    defaults 0 0
  ```

  * if VDO is used:

  ```text
  /dev/mapper/kodo    /kodo_data    xfs    defaults,discard,x-systemd.requires=vdo.service 0 0
  ```

* Mount the disk device \(all filesystems mentioned in `/etc/fstab` file to be mounted as indicated\): 

  ```text
  mount -a
  ```

* Confirm with `df` command that your directory `/kodo_data` is mounted
* Create staging space and backup destination directories

  ```text
  mkdir -p /kodo_data/staging
  mkdir -p /kodo_data/backup
  ```

* Set ownership to `kodo` user on directory `/kodo_data`:

  ```text
  chown kodo:kodo -R /kodo_data
  ```



