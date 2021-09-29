# Launch backup & recovery

## Backup "on-demand"

The first backup of Microsoft 365 organization data is always executed as a "**full**" one by default. It means, that all entities of selected Microsoft 365 features will be protected and stored. To perform full "**on-demand backup**" of Exchange Online Mailboxes, Exchange Online Archives, Calendars, Contacts, OneDrive for Business, SharePoint Online files and Teams, do the following:

1. Go to the **Protection** menu.
2. Select entities you want to protect and click the **Backup** button.
3. In the **Backup job assistant** window, select the **According to policy** option or select the **Select a feature** to choose from available features.
4. If you click the **Schedule** button, you should see that the **Create backup once** option is selected.
5. Click on the **Save** button.

![](../.gitbook/assets/image%20%2879%29.png)

The backup for selected entities is running and the backup job was created under the Jobs menu. Now you can monitor the backup progress in the Tasks menu. Once the backup job is finished, you can do the data recovery.

## Data recovery

If you want to restore Microsoft 365 user's data to Microsoft 365 organization, do as follow:

1. Go to the **Protection** menu.
2. Click a user name to see his protected Microsoft 365 features.
3. Switch to a feature you want to recover \(by clicking the appropriate tab\) and then select protected data \(items or folders\) from listed entities by marking the radio button. 
4. Press the **Restore** button at the right-top window corner. The **Restore job assistant** window will appear.
5. Select recovery options and click the **Save & run** button to start the recovery process.

Go to the [Overview](https://storware.gitbook.io/kodo-for-cloud-office365/overview) section to learn more about KODO for Cloud server.

