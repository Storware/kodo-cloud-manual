# Configure Microsoft 365 access

Before you start to configure backup policies and jobs, KODO for Cloud server has to get access to your Microsoft 365 organization configuration first.

Access to data is performed via an application configured in your Microsoft 365 organization.

{% hint style="warning" %}
You can skip this step if you want to add your Microsoft 365 organization to KODO for Cloud server using the Setup Assistant. If not, please proceed with the next steps.
{% endhint %}

{% hint style="info" %}
KODO does not store your Microsoft 365 administrative id and password.
{% endhint %}

## Manually registering an application with Azure Active Directory

A new Microsoft 365 application has to be registered and configured in Azure Active Directory. When it's done, in the next step you can add the application (organization) to KODO for Cloud server.

The instruction is as follow:

1. Go to the Azure portal ([https://portal.azure.com/](https://portal.azure.com/)) page and sign in to your Microsoft account by using your Microsoft 365 administrative user ID and password.
2. In the home view, go to **Manage Azure Active Directory** (click the **View** button).
3. To open the Azure Active Directory admin center, in the left pane, click the ellipsis to expand the Show all menu, and then click **Admin centers** > **Azure Active Directory**.
4. In the tenant dashboard menu, click **App registrations** and then click **New registration**.
5. Specify a user-facing name for the Microsoft 365 application, on the **Register an application** page by entering a name in the **Name** field.
6. Use the default options for the remaining fields, and click **Register**. The app registration is set up with the user-facing name that you entered.
7. To obtain the application (**client**) ID, and directory (**tenant**) ID string, go to **Azure Active Directory > tenant - App registrations > Owned applications**. Click the application name, copy the application ID string and directory ID. These strings will be required later when you register the Microsoft 365 service on KODO for Cloud server.
8. To create a client secret for this application ID, click **Certificates & secrets** > **New client secret**.
9. On the "**Add a client secret**" pane, enter any user name in the **Description** field, and click **Add**. A client secret is generated, and the value is then displayed in the Client secrets pane.
10. Copy the client secret to the clipboard by using the copy icon next to the Client secret value field. This character string is also used for registration with KODO for Cloud server.
11. To add permissions for this application ID, click **API permissions** > **Add a permission**.
12. Specify permissions for each API in the following table by taking the following actions. Select the API name, for example, Azure Active Directory Graph.

    | API                              | Permission name                      | Permission type |
    | -------------------------------- | ------------------------------------ | --------------- |
    | **Azure Active Directory Graph** | Calendars.ReadWrite                  | Application     |
    | **Microsoft Graph**              | Channel.Create                       | Application     |
    | **Microsoft Graph**              | Channel.ReadBasic.All                | Application     |
    | **Microsoft Graph**              | ChannelMember.Read.All               | Application     |
    | **Microsoft Graph**              | ChannelMember.ReadWrite.All          | Application     |
    | **Microsoft Graph**              | ChannelMessage.Read.All              | Application     |
    | **Microsoft Graph**              | Chat.Read.All                        | Application     |
    | **Microsoft Graph**              | Chat.ReadBasic.All                   | Application     |
    | **Microsoft Graph**              | Chat.ReadWrite.All                   | Application     |
    | **Microsoft Graph**              | ChatMember.Read.All                  | Application     |
    | **Microsoft Graph**              | ChatMember.ReadWrite.All             | Application     |
    | **Microsoft Graph**              | Contacts.ReadWrite                   | Application     |
    | **Microsoft Graph**              | Directory.ReadWrite.All              | Application     |
    | **Microsoft Graph**              | Files.ReadWrite.All                  | Application     |
    | **Microsoft Graph**              | Group.Create                         | Application     |
    | **Microsoft Graph**              | Group.ReadWrite.All                  | Application     |
    | **Microsoft Graph**              | GroupMember.Read.All                 | Application     |
    | **Microsoft Graph**              | GroupMember.ReadWrite.All            | Application     |
    | **Microsoft Graph**              | Mail.ReadWrite                       | Application     |
    | **Microsoft Graph**              | MailboxSettings.Read                 | Application     |
    | **Microsoft Graph**              | MailboxSettings.ReadWrite            | Application     |
    | **Microsoft Graph**              | Member.Read.Hidden                   | Application     |
    | **Microsoft Graph**              | Sites.FullControl.All                | Application     |
    | **Microsoft Graph**              | Sites.Manage.All                     | Application     |
    | **Microsoft Graph**              | Sites.Read.All                       | Application     |
    | **Microsoft Graph**              | Sites.ReadWrite.All                  | Application     |
    | **Microsoft Graph**              | Team.Create                          | Application     |
    | **Microsoft Graph**              | Team.ReadBasic.All                   | Application     |
    | **Microsoft Graph**              | TeamMember.Read.All                  | Application     |
    | **Microsoft Graph**              | TeamMember.ReadWrite.All             | Application     |
    | **Microsoft Graph**              | TeamMember.ReadWriteNonOwnerRole.All | Application     |
    | **Microsoft Graph**              | TeamsApp.ReadWrite.All               | Application     |
    | **Microsoft Graph**              | TeamSettings.ReadWrite.All           | Application     |
    | **Microsoft Graph**              | TeamsTab.Create                      | Application     |
    | **Microsoft Graph**              | TeamsTab.ReadWrite.All               | Application     |
    | **Microsoft Graph**              | TeamsTab.ReadWriteForChat.All        | Application     |
    | **Microsoft Graph**              | TeamsTab.ReadWriteForTeam.All        | Application     |
    | **Microsoft Graph**              | TeamsTab.ReadWriteForUser.All        | Application     |
    | **Microsoft Graph**              | User.Read.All                        | Application     |
    | **Microsoft Graph**              | User.ReadWrite.All                   | Application     |
    | **Office 365 Exchange Online**   | full\_access\_as\_app                | Application     |
    | **SharePoint**                   | Sites.FullControl.All                | Application     |
    | **SharePoint**                   | Sites.Manage.All                     | Application     |
    | **SharePoint**                   | Sites.Read.All                       | Application     |
    | **SharePoint**                   | Sites.ReadWrite.All                  | Application     |
    | **SharePoint**                   | User.ReadWrite.All                   | Application     |
13. To set the permission "**full\_access\_as\_app**" in the Office 365 Exchange Online API, click "**Add a permission**" option and in the "**Request API permissions**" window go to "**APIs my organization uses**" and search for "**Office 365 Exchange Online**", then select "**Application permissions**" and check "**full\_access\_as\_app**" from "**Other permissions**".
14. To save the selected permissions, click **Grant admin consent for \<your organization name**>.
15. Since you're granting tenant scoped permissions this granting can only be done via the **appinv.aspx** page on the tenant administration site. You can reach this site by typing the address: **https://tenantName-admin.sharepoint.com/\_layouts/15/appinv.aspx**. (replace the **tenantName** with your tenant name). Once the page is loaded, do as follow:
    1. Enter your App Id (client ID) and click the **Lookup** button.
    2. Enter the App Domain name.&#x20;
    3. In the "**App's Permission Request** **XML"** window enter the following lines:&#x20;

```
<AppPermissionRequests AllowAppOnlyPolicy="true">
    <AppPermissionRequest Scope="http://sharepoint/content/tenant" 
     Right="FullControl" />
 </AppPermissionRequests>
```

16\. When you click on the **Create** button you'll be presented with a permission consent dialog. Press the **Trust It** button to grant the permissions.

17\. Open Powershell command prompt and execute the command:&#x20;

```
Connect-SPOService https://tenantName-admin.sharepoint.com
Set-SPOTenant -LegacyAuthProtocolsEnabled $True
```

It enables the **LegacyAuthProtocolsEnabled** setting.&#x20;

Go to the [KODO Multi-Organization Management](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/microsoft-365-organization-management/kodo-multi-organization-management) section to learn how to configure the KODO organization.
