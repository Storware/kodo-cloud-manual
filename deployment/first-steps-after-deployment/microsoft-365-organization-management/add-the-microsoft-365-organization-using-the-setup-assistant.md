# Add Microsoft 365 organization using the Setup Assistant

To add your Microsoft 365 organization to KODO for Cloud server using Setup Assistant, do as follow:

1. Log into Kodo for Cloud server as the organization admin.
2. Go to the **Settings** menu.
3. Select the **Microsoft 365** **Organizations** tab.
4. Click the **Add Organization** button and select the **Setup Assistant** option.
5. In the **Wizard** window read the information and click the **Next** button to go to the next step.
6. Click the link **https://microsoft.com/devicelogin.** 
7. Copy the authorization code and enter it, and next sign in to your Microsoft 365 organization as a user with administrator's rights. Close the window when finished.
8. The application tenant is created. Click the **Next** button to go to the next step.
9. Grant permissions to the "**KODO for Cloud**" application by logging into Microsoft 365 organization. Click the "**Log in to Microsoft 365**" button.
10. [ ](https://microsoft.com/devicelogin)Log in as the administrator and click **Accept** button to grant permissions for the created application.
11. You will be redirected to the KODO admin dashboard. Enter the name for the config. 
12. Check the "**Import users**" and "**Import sites**" options to import these assets.  
13. You can optionally provide a user name and password for the defined user to backup up shared mailboxes. The user account should have set "**Global reader**" permission to read information about **Exchange shared mailboxes.**
14. Save your settings by clicking the **Save** button.
15. You will be asked about import users and sites. If everything was set properly, the validation status should be "**COMPLETED**".
16. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. \(replace the **tenantName** with your tenant name\). Once the page is loaded, do as follow:
17. Enter your App Id \(client ID\) and click the **Lookup** button.
18. Enter the App Domain name. 
19. In the "**App's Permission Request** **XML"** window enter the following lines: 

```text
<AppPermissionRequests AllowAppOnlyPolicy="true">
    <AppPermissionRequest Scope="http://sharepoint/content/tenant" 
     Right="FullControl" />
 </AppPermissionRequests>

```

20. When you click on the **Create** button you'll be presented with a permission consent dialog. Press the **Trust It** button to grant the permissions.

21. Open Powershell command prompt and execute the command: 

```text
Connect-SPOService https://tenantName-admin.sharepoint.com
Set-SPOTenant -LegacyAuthProtocolsEnabled $True
```

It enables the **LegacyAuthProtocolsEnabled** setting. 

Go to the [Account auto-synchronization](auto-mode-global-admin-authentication.md) to learn how to synchronize Microsoft 365 accounts.



