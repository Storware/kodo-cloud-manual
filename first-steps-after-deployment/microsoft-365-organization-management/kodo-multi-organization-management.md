# KODO Multi-Organization Management

On KODO for Cloud server the administrator can define more than one Microsoft 365 organization to protect. In a purchased license the following limitations are included:

* **MAX\_ORGANIZATIONS** - maximum number of organization to define.
* **MAX\_TENANTS\_PER\_ORG** - maximum number of tenants to define per organization
* **MAX\_USERS**- maximum number of protected users.

 More information about licensing can be found in the [Lisensing ](../../overview/licensing.md)paragraph.

To add your Microsoft 365 organization to KODO for Cloud server, do as follow:

1. Log into Kodo for Cloud server as the organization admin.
2. Go to the **Settings** menu.
3. Select the **Organizations** tab.
4. Click the **Add Organization** button and select **Manually** option.
5. In the **Microsoft 365 Configuration** window you have to enter information as follow:
   1. Tenant ID
   2. Client ID
   3. Client secret
6. Select **Import users** and **Import sites** if you want to perform the import tasks after the organization is creted.
7. You can optionally provide user name and password for the defined user. The user should have set permissions to read information about **Exchange shared mailboxes** if you are going to backup this asset. 
8. Save you settings by clicking the **Save** button.
9. Now you can go to the **Users** menu. Click the **Synchronize** button to synchronize users from your organization with KODO for Cloud server. 



{% hint style="danger" %}
The Auto option to add your Microsoft 365 organization is not available in this version of KODO for Cloud server. It will be in the future releases. 
{% endhint %}
