# Add Microsoft 365 Organization

To add your Microsoft 365 organization to KODO for Cloud server using Setup Assistant, do as follow:

1. Go to the **Settings** menu -&gt; select the **Microsoft 365** **Organizations** tab -&gt; click the **Add Organization** button -&gt; select the **Setup Assistant** option.
2. In the **Wizard** window read the information and click the **Next** button to go to the next step.
3. Copy the authorization code -&gt; click the link **https://microsoft.com/devicelogin** and enter it -&gt; sign in to your Microsoft 365 organization as a user with administrator's rights. 
4. The application tenant is created. Click the **Next** button to go to the next step.
5. Click the "**Log in to Microsoft 365**" button -&gt;[ ](https://microsoft.com/devicelogin)log in as the administrator and click **Accept** button to grant permissions for the created application.
6. You will be redirected to the KODO admin dashboard. Enter the name for the config. 
7. Check the "**Import users**" and "**Import sites**" options to import these assets.  
8. Save your settings by clicking the **Save** button.
9. You will be asked about import users and sites. If everything was set properly, the validation task status should be "**COMPLETED**".

## Required permissions

1. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. \(replace the **tenantName** with your tenant name\). Once the page is loaded, do as follow:
2. Enter your App Id \(client ID\) and click the **Lookup** button.
3. Enter the App Domain name. 
4. In the "**App's Permission Request** **XML"** window enter the following lines: 

   ```text
   <AppPermissionRequests AllowAppOnlyPolicy="true">
       <AppPermissionRequest Scope="http://sharepoint/content/tenant" 
        Right="FullControl" />
    </AppPermissionRequests>
   ```

5. When you click on the **Create** button you'll be presented with a permission consent dialog. Press the **Trust It** button to grant the permissions.
6. Open Powershell command prompt and execute the command: 

   ```text
   Connect-SPOService https://tenantName-admin.sharepoint.com
   Set-SPOTenant -LegacyAuthProtocolsEnabled $True
   ```

It enables the **LegacyAuthProtocolsEnabled** setting. 

Go to the [Launch backup & recovery]() chapter to learn how to backup and recover Microsoft 365 data.

