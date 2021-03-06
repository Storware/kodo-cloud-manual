# Adding Microsoft 365 organization manually

Before starting to work with data, KODO for Cloud first needs to get access to your Microsoft 365 Organization.

Access to data is performed via an application installed in your organization.

{% hint style="info" %}
KODO does not store your Microsoft 365 administrative id or password
{% endhint %}

## Manually registering an application with Azure Active Directory

Follow the instruction to register KODO for Cloud application and add Microsoft 365 organization to KODO:

1. Go to the Azure portal \([https://portal.azure.com/](https://portal.azure.com/)\) page and sign in to your Microsoft account by using your Microsoft 365 administrative user ID and password.
2. To open the Azure Active Directory admin center, in the left pane, click the ellipsis to expand the Show all menu, and then click **Admin centers** &gt; **Azure Active Directory**.
3. To open your tenant dashboard, in the left pane of the Azure Active Directory admin center, click **Azure Active Directory**.
4. In the tenant dashboard menu, click **App registrations** and then click **New registration**.
5. To specify a user-facing name for the Microsoft 365 application, on the "**Register an application**" page, enter a name in the **Name** field.
6. Use the default options for the remaining fields, and click **Register**. The app registration is set up with the user-facing name that you entered.
7. To obtain the application \(**client**\) ID, and directory \(**tenant**\) ID string, click **Azure Active Directory &gt; tenant - App registrations &gt; App name**. Then, copy the application ID string and directory ID. These strings will be required later when you register the Microsoft 365 application with KODO for Cloud server.
8. To create a client secret for this application ID, click **Certificates & secrets** &gt; **New client secret**.
9. On the "**Add a client secret**" pane, enter any user name in the **Description** field, and click **Add**. A client secret is generated, and the value is then displayed in the Client secrets pane.
10. Copy the client secret to the clipboard by using the copy facility next to the Client secret value field. This character string is also used for registration with KODO for Cloud server.
11. To add permissions for this application ID, click **API permissions** &gt; **Add permissions**.
12. Specify permissions for each API in the following table by taking the following actions. Select the API name, for example, Azure Active Directory Graph.

    1. For permission name User.Read.All, select the **Delegated Permissions** type.
    2. For the remaining permissions, select the **Application Permissions** type for each permission name for the API in the table.

    | API | Permission name |
    | :--- | :--- |
    | Azure Active Directory Graph | User.Read.All |
    | Azure Active Directory Graph | Directory.Read.All |
    | Exchange | full\_access\_as\_app |
    | Microsoft Graph | Calendars.ReadWrite |
    | Microsoft Graph | Contacts.ReadWrite |
    | Microsoft Graph | Files.ReadWrite.All |
    | Microsoft Graph | Mail.ReadWrite |
    | Microsoft Graph | Sites.Read.All |
    | Microsoft Graph | User.Read |
    | Microsoft Graph | User.Read.all |

13. To save the selected permissions, click Grant admin consent for &lt;your organization name&gt;.



