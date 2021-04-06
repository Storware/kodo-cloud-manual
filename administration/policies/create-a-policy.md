# Create a policy

To create a data policy do the following:

1. Go to the **Policies** view
2. Click on the **Add Policy** button
3. Configure the data policy due to your company backup regulations and confirm settings by pressing the **Save** button. 

![](../../.gitbook/assets/image%20%2842%29.png)

{% hint style="info" %}
Data Policy configuration will apply to all users. 
{% endhint %}

### Retention time

KODO for Cloud gives you the flexibility to configure backup retention. Backup retention settings apply only to items \(like files, emails, contacts, or calendars\) that have been deleted from the source.

If you configure retention for 7 days you will have 7 days to restore item\(s\) deleted by the user. All data that exist at the source will never be deleted.

### Versions to keep

You can specify the number of backup versions to keep.

{% hint style="info" %}
The minimum value for **Versions to keep** is 1. The default value is 5.
{% endhint %}

{% hint style="info" %}
Versioning is used e.g. for OneDrive files \(if the file is changed in time\), but also e-mail messages can have many version \(mail draft changed in time\)
{% endhint %}

{% hint style="info" %}
The number of versions that the server keeps is also affected by the time retention setting. Versions expire when the number of days that they are inactive exceeds the value that is specified for retaining, even when the number of versions is not exceeded.
{% endhint %}

### Storage

Select a storage you want to store your data.



