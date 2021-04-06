# KODO Admin

The **kodoadmin** user is a predefined administrative user on KODO for Cloud server.  If you are logging in to the  server as `kodoadmin` then you can edit the server settings in the tabs.

## General Settings

Here you can edit the following settings:

* **Deployment server name** - ****the hostname of KODO for Cloud server
* **Allowed IP addresses for KodoAdmin** - allowed IP addresses to login with KodoAdmin role
* **Support website URL** -the address of the KODO support website.
* **Product website URL**- the address of Storware support website.
* **Documentation website URL** - the address of the KODO documentation website.

![](../../../.gitbook/assets/image%20%2826%29.png)

## **Purge Expired Backups Settings**

Set the time and day when obsolete information about backed up files will be removed from the server.

![](../../../.gitbook/assets/image%20%2846%29.png)

## Email tab

You have to add the email settings for KODO for Cloud server to be able to send notifications. You have to add the following settings:

* **E-mail address** - the email address of the sender
* **Login** - usually it's the same as the email address 
* **Server address -** SMTP server IP name or address \(for Microsoft 365 service the server name is smtp.office365.com\), but you can use any other SMTP server.
* **Port** -usually it's port 25 or 587.
* **use SSL** - check it if you want to use SSL protocol.
* **Password -** the password for the user provided in the  "**Login**" form.

## Stage tab

Here you can edit the following settings:

* Staging path
* Staging storage free space warning threshold

## Logs tab

Here you can edit the following settings:

* Maximum number of files 
* Log level
* Max file size

You can also download Server logs or Application Logs for troubleshooting or to send this information to KODO support.

## License tab

Here you can preview the current license or update a new one.

## Billing tab

Here you can edit your billing settings. This information is used by kodoadmin to charge all defined organizations in Kodo for Cloud server separately.

