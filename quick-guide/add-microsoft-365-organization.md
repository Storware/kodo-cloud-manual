# Add Microsoft 365 Organization

To add your Microsoft 365 organization to KODO for Cloud server using Setup Assistant, do as follow:

1. Go to the **Settings** menu -> select the **Microsoft 365** **Organizations** tab -> click the **Add Organization** button -> select the **Setup Assistant** option.
2. In the **Wizard** window, read the information placed there, and click the **Next** button to go to the next step.
3. Copy the authorization code -> click the link **https://microsoft.com/devicelogin** and paste the code -> sign in to your Microsoft 365 organization as a user with administrator's rights.&#x20;
4. Confirm that you trying to log in to the **KODO for Cloud** application. Click the **Continue** button.
5. The message: "**You have logged into the KODO for Cloud app on your device. You can now close this window."** should be displayed. You can close the window and switch to the **Wizard** window.
6. The message "**Application has been sucessfully created**" should be displayed along with a detailed information window.  It means, that the application tenant is created. Click the **Next** button to go to the next step.
7. Click the **Log in to Microsoft 365** button ->[ ](https://microsoft.com/devicelogin)log in as the administrator and click the **Accept** button to grant permissions for the created application.
8. You will be redirected to the KODO admin dashboard. Enter the name for the config.&#x20;
9. Check the **Import users** and **Import sites** options to import these assets. &#x20;
10. Save your settings by clicking the **Save** button.
11. You will be asked about import users and sites. If everything was set properly, the validation task status should be **COMPLETED**.

## Required permissions

1. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. (replace the **tenantName** with your tenant name). Once the page is loaded, do as follow:
2. Enter your App Id (client ID) and click the **Lookup** button.
3. Enter the App Domain name.&#x20;
4.  In the **App's Permission Request** **XML** window enter the following lines:&#x20;

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

The command enables the **LegacyAuthProtocolsEnabled** setting.&#x20;

Go to the [Launch backup & recovery](https://storware.gitbook.io/kodo-for-cloud-office365/quick-guide/lauching-backup-and-recovery) section to learn how to backup and recover Microsoft 365 data.
