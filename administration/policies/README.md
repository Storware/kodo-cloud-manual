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

![](../../.gitbook/assets/kodo-cloud-administration-policies01.png)

{% hint style="info" %}
Data Policy configuration will apply to all users and tasks
{% endhint %}

##  Retention time

KODO gives you flexibility to configure backup retention. Backup retention settings applies only to items \(like files or messages\) that have been delete from the source.

If you configure retention for 7 days you will have 7 days to restore item\(s\) deleted by user. All data that exist at source will never be deleted.

### Version to keep

You can specify the number of backup versions to keep.

{% hint style="info" %}
Minimum number version to keep is 1. The default value is 5.
{% endhint %}

![](../../.gitbook/assets/image%20%281%29.png)

{% hint style="info" %}
Versioning is used e.g. for OneDrive files \(if file is changed in time\), but also e-mail messages can have many version \(mail draft changed in time\)
{% endhint %}

{% hint style="info" %}
The number versions that the server keeps is also affected by the time retention setting. Versions expire when the number of days that they are inactive exceeds the value that is specified for retaining, even when the number of versions is not exceeded.
{% endhint %}



