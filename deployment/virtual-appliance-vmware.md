# Virtual Appliance \(VMware\)

## How to access a Virtual Appliance

You can download the virtual appliance from the following link:

[ftp://kodo4cloud@ftp.storware.eu/](ftp://kodo4cloud@ftp.storware.eu/)

**Login:** kodo4cloud  
**Password:** sEkQsrdsr98Q

## Logging to the virtual appliances



Use credentials listed below to log in to the system:

> **Login:** kodo  
> **Password:** Zt3edWny



{% hint style="warning" %}
### NOTE: FOR SECURITY REASONS PLEASE CHANGE PASSWORD AFTER THE FIRST LOGIN TO THE SYSTEM.
{% endhint %}

Use `passwd` command to change the password for **kodo** user

```text
$ passwd
```

Type the old password and the new password two times:

```text
Changing password for kodo.
Old Password:
New Password:
Retype New Password:
```

## Setting up network configuration

The next step is to configure the network connection. To do this you will need to edit the network configuration file. The default configuration will try to assign IP address from DHCP server.

Use `sudo` command to run a shell with root privileges:

```text
$ sudo -s
```

When ask for password use password for kodo user.

Edit network configuration file:

```text
# nano /etc/sysconfig/network-scripts/ifcfg-ens192
```

To set up static IP address change the BOOTPROTO parameter:

```text
BOOTPROTO=dhcp
```

to

```text
BOOTPROTO=static
```

Next add to the file  following options:

* IPADDR=YOUR\_IP\_ADDRESS
* NETMASK=YOUR\_NETMASK
* GATEWAY=YOUR\_GATEWAY

and set them according to your local network: 

**IPADDR** - IP address of KODO Server  
**NETMASK** - netmask value of your network  
**GATEWAY** - gateway value of your network

Here you have a sample configuration file:

```text
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
IPADDR=xxx.xxx.xxx.xxx
NETMASK=xxx.xxx.xxx.xxx
GATEWAY=xxx.xxx.xxx.xxx
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens192
DEVICE=ens192
ONBOOT=yes
```

Save the file pressing the `CTRL+o` and then `Enter` key.

After the file is saved you can exit the editor by pressing `CTRL+x` key combination.

The final step is to restart the network configuration. To do this use the following command:

```text
# systemctl restart NetworkManager.service
```

Now you should be able to login to your KODO for Cloud server using a web browser and IP address that you've configured in previous steps. Open a web browser and enter:

```text
https://ip_address
```

