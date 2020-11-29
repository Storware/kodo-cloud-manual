# Configure Microsoft 365 access

Before you start to configure backup policies and jobs, KODO for Cloud has to get access to your Microsoft 365 Organization configuration first.

Access to data is performed via an application installed in your organization.

{% hint style="info" %}
KODO does not store your Microsoft 365 administrative id and password.
{% endhint %}

## Manually registering an application with Azure Active Directory

A new Microsoft 365 application have to be registered and configured in Azure Active Directory. When it's done, in the next step you can add the application \(organization\) to KODO for Cloud server.

The instruction is as follow:

1. Go to the Azure portal \([https://portal.azure.com/](https://portal.azure.com/)\) page and sign in to your Microsoft account by using your Microsoft 365 administrative user ID and password.
2. In the home view, go to **Mange Azure Active Directory** \(click the "View" button\).
3. To open the Azure Active Directory admin center, in the left pane, click the ellipsis to expand the Show all menu, and then click **Admin centers** &gt; **Azure Active Directory**.
4. In the tenant dashboard menu, click **App registrations** and then click **New registration**.
5. Specify a user-facing name for the Microsoft 365 application, on the "**Register an application**" page by entering a name in the **Name** field.
6. Use the default options for the remaining fields, and click **Register**. The app registration is set up with the user-facing name that you entered.
7. To obtain the application \(**client**\) ID, and directory \(**tenant**\) ID string, go to **Azure Active Directory &gt; tenant - App registrations &gt; Owned applications**. Click the application name, copy the application ID string and directory ID. These strings will be required later when you register the Microsoft 365 service on KODO for Cloud server.
8. To create a client secret for this application ID, click **Certificates & secrets** &gt; **New client secret**.
9. On the "**Add a client secret**" pane, enter any user name in the **Description** field, and click **Add**. A client secret is generated, and the value is then displayed in the Client secrets pane.
10. Copy the client secret to the clipboard by using the copy icon next to the Client secret value field. This character string is also used for registration with KODO for Cloud server.
11. To add permissions for this application ID, click **API permissions** &gt; **Add permission**.
12. Specify permissions for each API in the following table by taking the following actions. Select the API name, for example, Azure Active Directory Graph.

    1. For permission name User.Read.All, select the **Delegated Permissions** type.
    2. For the remaining permissions, select the **Application Permissions** type for each permission name for the API in the table.

    | API | Permission name | Permission type |
    | :--- | :--- | :--- |
    | Azure Active Directory Graph | User.Read.All | Delegated |
    | Azure Active Directory Graph | Directory.Read.All | Application |
    | Office 365 Exchange Online | full\_access\_as\_app | Application |
    | Microsoft Graph | Calendars.ReadWrite | Application |
    | Microsoft Graph | Contacts.ReadWrite | Application |
    | Microsoft Graph | Files.ReadWrite.All | Application |
    | Microsoft Graph | Mail.ReadWrite | Application |
    | Microsoft Graph | Mail.Read | Application |
    | Microsoft Graph | Sites.ReadWrite.All | Application |
    | Microsoft Graph | User.Read | Delegated |
    | Microsoft Graph | User.Read.all | Application |
    | SharePoint | AllSites.FullControl | Delegated |
    | SharePoint | Sites.FullControl.All | Application |
    | SharePoint | User.Read.All | Application |
    | SharePoint | User.ReadWrite.All | Application |

13. To save the selected permissions, click **Grant admin consent for &lt;your organization name**&gt;.
14. Go to the next chapter to add organization to KODO for Cloud server. 



