# Staging space and backup destination configuration

Kodo for Cloud needs staging space and backup destination available in `/kodo_data` by default. It is common to just attach empty drive and mount it.

## Deduplication \(VDO\) setup

These steps are required only if you want to use VDO deduplication.

* Install VDO

  ```text
  yum -y install vdo
  ```

* Start and enable VDO service

  ```text
  systemctl start vdo
  systemctl enable vdo
  ```

* Create VDO device on top of your physical block device
  * let's assume it is `/dev/sdc`
  * we estimate by default the logical size of the VDO device to be 3 times the size of your physical device, so in this example, for 1 TiB physical size, we can try with 3 TiB logical size
  * if the block device is larger than 16 TiB, add the `--vdoSlabSize=32G` parameter at the end to increase the slab size on the volume to 32 GiB.

    ```text
    vdo create --name=kodo --device=/dev/sdc --vdoLogicalSize=3T
    ```
* Now proceed with the steps described in Preparing file system section of [Staging space and backup destination configuration](staging-space-and-backup-destination-configuration.md#preparing-file-system) - replace block device mentioned \(i.e. `/dev/sdc` with VDO device `/dev/mapper/kodo`

## Preparing file system

You also can use a plain file system for staging space \(and optionally for backup destination\). Here are steps assuming you have a local \(physical or virtual\) disk.

* List all existing disks, and find your dedicated disk - in this example - `/dev/sdc` \(use `/dev/mapper/kodo` instead of `/dev/sdc` if VDO is used\):

  ```text
     [root@vProtect01 ~]# fdisk -l | grep dev
     Disk /dev/sda: 32.2 GB, 32212254720 bytes, 62914560 sectors
     /dev/sda1   *        2048     1026047      512000   83  Linux
     /dev/sda2         1026048    62914559    30944256   8e  Linux LVM
     Disk /dev/sdc: 500 GB, 17179869184 bytes, 33554432 sectors
     Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
     Disk /dev/mapper/centos-root: 28.5 GB, 28462546944 bytes, 55590912 sectors
     Disk /dev/mapper/centos-swap: 3221 MB, 3221225472 bytes, 6291456 sectors
  ```

* If you have new clean disk prepare a filesystem on it \(use `/dev/mapper/kodo` instead of `/dev/sdc` if VDO is used\):

  ```text
  mkfs.xfs -K /dev/sdc
  ```

* Add a line to `/etc/fstab` file, to automatically mount new filesystem after reboot \(use `/dev/mapper/kodo` instead of `/dev/sdc` if VDO is used\):

  ```text
  /dev/sdc    /kodo_data    xfs    defaults 0 0
  ```

* Mount

  ```text
  mount -a
  ```

* Confirm with `df` that your `/kodo_data` is mounted
* Create staging space and backup destination directories

  ```text
  mkdir -p /kodo_data/staging
  mkdir -p /kodo_data/backup
  ```

* Set ownership to `kodo` user on directory `/kodo_data`:

  ```text
  chown kodo:kodo -R /kodo_data
  ```

