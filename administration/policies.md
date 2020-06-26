# Policies

Data policy allows you to configure:

* Set a default policy
* Backup retention \(day\(s\), month\(s\), year\(s\)\)
* Number of protected item\(s\) or file\(s\) versions 
* Protected Microsoft 365 services \(SLA\):
  * Exchange Online Mailbox
  * Exchange Online Calendars
  * Exchange Online Contacts
  * OneDrive for Business

To configure data policy do the following steps:

1. Go to **Policies** view
2. Click on **Add Policy** button
3. Configure the data policy due to you company backup regulations and confirm settings by pressing **Save** button.  

![](../.gitbook/assets/kodo-cloud-administration-policies01.png)

{% hint style="info" %}
Data Policy configuration will apply to all users and tasks
{% endhint %}

## Access to data by administrator

Select this option to allow system administrators to download user data directly to computer.

If this option is not select only restore to cloud \(Microsoft Office365\) is possible.

![](../.gitbook/assets/image%20%2824%29.png)

## Backup retention

KODO gives you flexibility to configure backup retention. Backup retention settings applies only to items \(like files or messages\) that have been delete from the source.

If you configure retention for 7 days you will have 7 days to restore item deleted by user. All data that exist at source will never be deleted.

You can use retention based on time or versions, or both

### Time based retention

Specify the number of days to keep backup versions.

### Version based retention

You specify the number of backup versions to keep.

![](../.gitbook/assets/image%20%281%29.png)

{% hint style="info" %}
Versioning is used e.g. for OneDrive files \(if file is changed in time\), but also e-mail messages can have many version \(mail draft changed in time\)
{% endhint %}

{% hint style="info" %}
The number versions that the server keeps is also affected by the time retention setting. Versions expire when the number of days that they are inactive exceeds the value that is specified for retaining, even when the number of versions is not exceeded.
{% endhint %}

## Include and Exclude

### Include extension

Provide \(comma separated\) files extension that should be Included in process of OneDrive backup.

### Exclude path

Provide \(comma separated\) paths that should be Excluded from OneDrive backup

### Include path

Provide \(comma separated\) paths that should be Included in process of OneDrive backup

### Exclude extension

Provide \(comma separated\) files extension that should be Excluded from OneDrive backup

