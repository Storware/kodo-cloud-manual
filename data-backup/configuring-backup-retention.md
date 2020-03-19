# Configuring data policy

Data policy allows you to configure:

* Access to data by administrator
* Backup retention 
* Quota
* Includes and Excludes for OneDrive feature backup

To configure data policy follow these steps:

1. Go to **Settings** view
2. Click on **Data Policy** tab
3. Use description below to customize **Data Policy** to your needs

{% hint style="info" %}
Data Policy configuration will apply to all users and tasks
{% endhint %}

## Access to data by administrator

Select this option to allow system administrators to download user data directly to computer.

If this option is not select only restore to cloud \(Microsoft Office365\) is possible. 

![](../.gitbook/assets/image%20%2823%29.png)

## Backup retention

KODO gives you flexibility to configure backup retention. Backup retention settings applies only to items \(like files or messages\) that have been delete from the source.

If you configure retention for 7 days you will have 7 days to restore item deleted by user. All data that exist at source will never be deleted.

You can use retention based on time or versions, or both

### Time based retention

Specify the number of days to keep backup versions.

![](../.gitbook/assets/image%20%2815%29.png)

{% hint style="info" %}
You can also select other, than days, unit of time measure
{% endhint %}

### Version based retention

You specify the number of backup versions to keep.

![](../.gitbook/assets/image%20%281%29.png)

{% hint style="info" %}
Versioning is used e.g. for OneDrive files \(if file is changed in time\), but also e-mail messages can have many version \(mail draft changed in time\)
{% endhint %}

{% hint style="info" %}
The number versions that the server keeps is also affected by the time retention setting. Versions expire when the number of days that they are inactive exceeds the value that is specified for retaining, even when the number of versions is not exceeded.
{% endhint %}

## Quota

In this section you can configure backup data quota per user. If the quota will be excessed backup task will fail.

Select a data unit and provide desired value.

![](../.gitbook/assets/image%20%2812%29.png)

## Include and Exclude

### Exclude path

Provide \(comma separated\) paths that should be Excluded from OneDrive backup 

![](../.gitbook/assets/image%20%2822%29.png)

### Include path

Provide \(comma separated\) paths that should be Included in process of OneDrive backup 

![](../.gitbook/assets/image%20%2811%29.png)

### Exclude extension

Provide \(comma separated\) files extension that should be Excluded from OneDrive backup 

![](../.gitbook/assets/image%20%2817%29.png)

### Max file size

Here you can provide maximum file size for backup process. If file excessed provided value, it will be omitted during backup process 

![](../.gitbook/assets/image%20%282%29.png)

### Include extension

Provide \(comma separated\) files extension that should be Included in process of OneDrive backup.

![](../.gitbook/assets/image%20%2814%29.png)

