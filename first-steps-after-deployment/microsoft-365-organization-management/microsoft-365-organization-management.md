# Configure Microsoft 365 access

Before you start to configure backup policies and jobs, KODO for Cloud has to get access to your Microsoft 365 organization configuration first.

Access to data is performed via an application installed in your organization.

{% hint style="info" %}
KODO does not store your Microsoft 365 administrative id and password.
{% endhint %}

## Manually registering an application with Azure Active Directory

A new Microsoft 365 application has to be registered and configured in Azure Active Directory. When it's done, in the next step you can add the application \(organization\) to KODO for Cloud server.

The instruction is as follow:

1. Go to the Azure portal \([https://portal.azure.com/](https://portal.azure.com/)\) page and sign in to your Microsoft account by using your Microsoft 365 administrative user ID and password.
2. In the home view, go to **Manage Azure Active Directory** \(click the **View** button\).
3. To open the Azure Active Directory admin center, in the left pane, click the ellipsis to expand the Show all menu, and then click **Admin centers** &gt; **Azure Active Directory**.
4. In the tenant dashboard menu, click **App registrations** and then click **New registration**.
5. Specify a user-facing name for the Microsoft 365 application, on the **Register an application** page by entering a name in the **Name** field.
6. Use the default options for the remaining fields, and click **Register**. The app registration is set up with the user-facing name that you entered.
7. To obtain the application \(**client**\) ID, and directory \(**tenant**\) ID string, go to **Azure Active Directory &gt; tenant - App registrations &gt; Owned applications**. Click the application name, copy the application ID string and directory ID. These strings will be required later when you register the Microsoft 365 service on KODO for Cloud server.
8. To create a client secret for this application ID, click **Certificates & secrets** &gt; **New client secret**.
9. On the "**Add a client secret**" pane, enter any user name in the **Description** field, and click **Add**. A client secret is generated, and the value is then displayed in the Client secrets pane.
10. Copy the client secret to the clipboard by using the copy icon next to the Client secret value field. This character string is also used for registration with KODO for Cloud server.
11. To add permissions for this application ID, click **API permissions** &gt; **Add a permission**.
12. Specify permissions for each API in the following table by taking the following actions. Select the API name, for example, Azure Active Directory Graph.

    | API | Permission name | Permission type |
    | :--- | :--- | :--- |
    | **Azure Active Directory Graph** | Directory.ReadWrite.All | Delegated |
    | **Azure Active Directory Graph** | User.ReadWrite.All | Application |
    | **Azure Active Directory Graph** | Directory.Read.All | Application |
    | **Azure Active Directory Graph** | User.Read.All | Delegated |
    | **Microsoft Graph** | Calendars.ReadWrite | Application |
    | **Microsoft Graph** | Contacts.ReadWrite | Application |
    | **Microsoft Graph** | Directory.Read.All | Delegated |
    | **Microsoft Graph** | Directory.ReadWrite.All | Application |
    | **Microsoft Graph** | Files.ReadWrite.All | Application |
    | **Microsoft Graph** | Mail.ReadWrite | Application |
    | **Microsoft Graph** | Mail.Read | Application |
    | **Microsoft Graph** | Sites.FullControl.All | Application |
    | **Microsoft Graph** | Sites.ReadWrite.All | Delegated |
    | **Microsoft Graph** | Sites.ReadWrite.All | Application |
    | **Microsoft Graph** | User.Read | Delegated |
    | **Microsoft Graph** | User.Read.All | Delegated |
    | **Microsoft Graph** | User.Read.All | Application |
    | **Microsoft Graph** | User.ReadWrite.All | Application |
    | **Office 365 Exchange Online** | full\_access\_as\_app | Application |
    | **Office 365 Exchange Online** | Exchange.ManageAsApp | Application |
    | **SharePoint** | AllSites.FullControl | Delegated |
    | **SharePoint** | AllSites.Manage | Delegated |
    | **SharePoint** | AllSites.Read | Delegated |
    | **SharePoint** | AllSites.Write | Delegated |
    | **SharePoint** | MyFiles.Read | Delegated |
    | **SharePoint** | MyFiles.Write | Delegated |
    | **SharePoint** | Sites.FullControl.All | Application |
    | **SharePoint** | Sites.Manage.All | Application |
    | **SharePoint** | Sites.Read.All | Application |
    | **SharePoint** | Sites.ReadWrite.All | Application |
    | **SharePoint** | User.Read.All | Application |
    | **SharePoint** | User.ReadWrite.All | Application |
    | **SharePoint** | User.ReadWrite.All | Application |

13. To set the permission "**full\_access\_as\_app**" in the Office 365 Exchange Online API, click "**Add a permission**" option and in the "**Request API permissions**" window go to "**APIs my organization uses**" and search for "**Office 365 Exchange Online**", then select "**Application permissions**" and check "**full\_access\_as\_app**" from "**Other permissions**".
14. To save the selected permissions, click **Grant admin consent for &lt;your organization name**&gt;.
15. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. \(replace the **tenantName** with the name of your tenant\). Once the page is loaded, do as follow:
    1. Enter your App Id \(client ID\) and click the **Lookup** button.
    2. Enter the App Domain name. 
    3. In the "**App's Permission Request** **XML"** window enter the following lines: 

```text
<AppPermissionRequests AllowAppOnlyPolicy="true">
    <AppPermissionRequest Scope="http://sharepoint/content/tenant" 
     Right="FullControl" />
 </AppPermissionRequests>

```

16. When you click on the **Create** button you'll be presented with a permission consent dialog. Press the **Trust It** button to grant the permissions.

17. Open Powershell command prompt and execute the command: 

```text
Connect-SPOService https://tenantName-admin.sharepoint.com
Set-SPOTenant -LegacyAuthProtocolsEnabled $True
```

It enables the **LegacyAuthProtocolsEnabled** setting. 

18. Go to the next chapter to add Microsoft 365 organization to KODO for Cloud server.

