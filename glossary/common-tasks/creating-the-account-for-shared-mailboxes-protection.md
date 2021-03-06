# Creating the account for shared mailboxes backup

Shared mailboxes are used when multiple people need access to the same mailbox, such as company information or support email address, reception desk, or other function that might be shared by several people. Users with permissions to the group mailbox can send as or send on behalf of the mailbox email address if the administrator has given that user permissions to do that.

If you are going to protect shared mailboxes in your Microsoft 365 service, you have to configure an account with dedicated permissions. 

1. Log in to the **Office.com** portal with  Microsoft 365 service administrator account.
2. Go to the **Admin** menu. A new tab in your web browser should be opened.
3. Go to the **Users** and select **Active users**.
4. Click **Add a user** and create a new user.
5. Click **Show all** and select **Exchange** from **Admin centers.** A new tab in your web browser should be opened.
6. Under the **Exchange admin center** go to the **Permissions** menu. In **Admin roles** view double-click **View-Only Organization Management**.
7. Add the created user to the **Members** of that role and click **Save** to continue.
8. Log into KODO for Cloud UI as the organization admin and go to the **Settings** menu.
9. Select the **Organizations** tab and edit the selected organization.
10.  Type the **username** and user **password**. Click **Save** to continue.
11. Go to the **Users** menu and click the **Synchronize** button.
12.  All shared mailboxes should be listed when the import task is finished. 

{% hint style="warning" %}
OneDrive service is not available for shared mailbox users. It is recommended to create a dedicated policy without "OneDrive for Business" selected in the SLA section to avoid failed tasks.
{% endhint %}



|  |
| :--- |




