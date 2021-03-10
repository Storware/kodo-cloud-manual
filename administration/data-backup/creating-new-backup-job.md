# Scheduled Backup

Follow the instruction to create a new backup job:

1. Go to the **Jobs** view. 
2. Click the **Create a Job** button.
3. Follow the steps of the wizard to configure the job.

![](../../.gitbook/assets/kodo-cloud-administration-backup05.png)

Enter a job name and select the following options:

* **Force full backup** - the backup will be executed with level "full"
* **According to policy** - Microsoft 365 features assigned to the policy will be included will in the backup tasks.
* **Select feature** - Microsoft 365 can be selected manually 

![](../../.gitbook/assets/kodo-cloud-job-01.png)

Click the **Selected entities** to include users and/or sites in the job. You can also use the search form to find a user or a site. Select entities and click the **Back** button to go to the prevoius window.

![](../../.gitbook/assets/image%20%2815%29.png)

Go to the **Schedule**  and set the time the

Set the following informations:

* Date and time the backup job starts
* Time zone
* Select the backup job interval

![](../../.gitbook/assets/image%20%2818%29.png)

Click **Back** button to go to the prevous window. Click **Save** button to finish. Click **Next** button to continue.

## What will happen next?

After creation, the task is set to the active state by default. When the time set in the task comes, the server will generate a task for each selected user. The tasks will wait in a queue to be processed by the cloud agent instance.

