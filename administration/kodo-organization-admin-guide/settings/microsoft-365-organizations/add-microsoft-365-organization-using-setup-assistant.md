# Add Microsoft 365 organization using Setup Assistant

To add your Microsoft 365 organization to KODO for Cloud server using Setup Assistant, do as follow:

1. Go to the **Settings** menu -> select the **Microsoft 365** **Organizations** tab -> click the **Add Organization** button -> select the **Setup Assistant** option.
2. In the **Wizard** window read the information and click the **Next** button to go to the next step. (ss)
3. Copy the authorization code -> click the link **https://microsoft.com/devicelogin** and enter it -> sign in to your Microsoft 365 organization as a user with administrator's rights.&#x20;
4. The application tenant is created. Click the **Next** button to go to the next step.
5. Click the "**Log in to Microsoft 365**" button ->[ ](https://microsoft.com/devicelogin)log in as the administrator and click **Accept** button to grant permissions for the created application.
6. You will be redirected to the KODO admin dashboard. Enter the name for the config.&#x20;
7. Check the "**Import users**" and "**Import sites**" options to import these assets. &#x20;
8. You can optionally provide a user name and password for the defined user to backup up shared mailboxes. The user account should have set "**Global reader**" permission to read information about **Exchange shared mailboxes.**
9. Save your settings by clicking the **Save** button.
10. You will be asked about import users and sites. If everything was set properly, the validation task status should be "**COMPLETED**".

## Required permissions

1. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. (replace the **tenantName** with your tenant name). Once the page is loaded, do as follow:
2. Enter your App Id (client ID) and click the **Lookup** button.
3. Enter the App Domain name.&#x20;
4.  In the "**App's Permission Request** **XML"** window enter the following lines:&#x20;

    ```
    <AppPermissionRequests AllowAppOnlyPolicy="true">
        <AppPermissionRequest Scope="http://sharepoint/content/tenant" 
         Right="FullControl" />
     </AppPermissionRequests>

    ```
5. When you click on the **Create** button you'll be presented with a permission consent dialog. Press the **Trust It** button to grant the permissions.
6.  Open Powershell command prompt and execute the command:&#x20;

    ```
    Connect-SPOService https://tenantName-admin.sharepoint.com
    Set-SPOTenant -LegacyAuthProtocolsEnabled $True
    ```

It enables the **LegacyAuthProtocolsEnabled** setting.&#x20;

Go to the [Launch backup & recovery](https://storware.gitbook.io/kodo-for-cloud-office365/quick-guide/lauching-backup-and-recovery) section to learn how to backup and recover users' Microsoft 365 data.
