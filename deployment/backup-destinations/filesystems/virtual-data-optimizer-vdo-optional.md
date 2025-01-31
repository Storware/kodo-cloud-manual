# Virtual Data Optimizer (VDO) - optional

As an optional backup destination, we propose to use Virtual Data Optimizer.&#x20;

VDO is the software that provides inline block-level **deduplication**, compression, and thin provisioning capabilities for primary storage.

VDO operates at the Linux block layer. This allows delivering benefits to local storage as well as to distributed block, file, or object storage solutions. It works by first eliminating 4KB zero byte blocks and duplicate blocks and then adds compression to the remaining blocks.

{% hint style="warning" %}
The amount of data reduction you will see with VDO will vary depending on the type of data being stored and the workflow that creates and stores the data. Already compressed data types such as video, audio, or graphical files will not benefit from this technology.&#x20;
{% endhint %}

## VDO configuration

&#x20;If you plan to use VDO deduplication for storing your backups, do as follow:&#x20;

* Add a disk device to your OS platform.&#x20;
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

* Install VDO device-mapper driver

```
# yum -y install vdo
```

* Reboot your OS platform to load VDO into the system kernel. Run `lsmod |grep vdo` command to make sure the VDO is loaded.&#x20;

```
[root@localhost ~]# lsmod |grep vdo
kvdo                  581632  1
uds                   253952  1 kvdo
dm_mod                151552  13 kvdo,dm_log,dm_mirror,dm_bufio
```

* Start and enable VDO device-mapper

```
# systemctl start vdo
# systemctl enable vdo
```

* Create a VDO device on top of your physical block device:
  * let's assume it is `/dev/sdb`
  * we estimate by default the logical size of the VDO device to be 3 times the size of your physical device, so in this example, for 1 TB physical size, we can try with 3 TB logical size
  * if the block device is larger than 16 TB, add the `--vdoSlabSize=32G` parameter at the end to increase the slab size on the volume to 32 GB.

```
# vdo create --name=kodo --device=/dev/sdb --vdoLogicalSize=3T
```

* Now proceed with steps described in the **Preparation** section below - use the block device name `/dev/mapper/kodo.`

## Preparation

* Log into KODO for Cloud server as the `root`user
*   List all existing disks in your server and find your dedicated disk - in this example -`/dev/mapper/kodo`

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
*   Format the disk `/dev/mapper/kodo`

    ```
    # mkfs.xfs -K /dev/mapper/kodo
    ```
*   Add a line to `/etc/fstab` file to automatically mount the new disk after server reboot:

    ```
    /dev/mapper/kodo    /kodo_data   xfs   defaults,discard,x-systemd.requires=vdo.service 0 0
    ```
*   Mount the disk device (all filesystems mentioned in `/etc/fstab` file to be mounted as indicated):&#x20;

    ```
    # mount -a
    ```
* Confirm with `df` command that your directory `/kodo_data` is mounted
*   Create staging space and backup destination directories

    ```
    # mkdir -p /kodo_data/staging
    # mkdir -p /kodo_data/backup
    # chown -R kodo:kodo /kodo_data/
    ```

The directories are prepared to store backup data. Now your KODO for Cloud installation is ready for the [Initial Configuration](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration) step.

Go to the [MS Azure Blob Storage](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/backup-destinations/microsoft-azure-blob-storage) section to learn how to configure that type of data storage.
