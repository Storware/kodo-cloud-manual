# Virtual Appliance \(VMware\)

## How to access the Virtual Appliance

You can download the KODO for virtual appliance from the following link:

[ftp://kodo4cloud@ftp.storware.eu/](ftp://kodo4cloud@ftp.storware.eu/)

**Login:** kodo4cloud  
**Password:** sEkQsrdsr98Q

## Logging into the virtual appliance

Use the credentials listed below to log in to the system:

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

## Setting up the network configuration

The next step is to configure the network connection. To do this you will need to edit the network configuration file. The default configuration will try to assign IP address from DHCP server.

Use `sudo` command to run a shell with root privileges:

```text
$ sudo -s
```

When asking for a password use the one for **`kodo`** user.

Edit network configuration file:

```text
# nano /etc/sysconfig/network-scripts/ifcfg-ens192
```

To set up a static IP address change the BOOTPROTO parameter:

```text
BOOTPROTO=dhcp
```

to

```text
BOOTPROTO=static
```

Next, add to the file the following options:

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

Save the file by pressing the `CTRL+o` and then `Enter` key.

After the file is saved you can exit the editor by pressing `CTRL+x` key combination.

The final step is to restart the network configuration.  Use the following command:

```text
# systemctl restart NetworkManager.service
```

Now you should be able to log into the web console using the URL: `https://KODO_SERVER_HOST:8181`, where `KODO_SERVER_HOST`is the hostname or IP address of your Kodo for Cloud server. 

```text
https://KODO_SERVER_HOST:8181
```

