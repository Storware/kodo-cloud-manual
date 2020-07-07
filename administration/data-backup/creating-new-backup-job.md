# Scheduled Backup

Follow the instruction to create a new backup job:

1. Go to the **Jobs** view. 
2. Click **Create a Job** button.
3. Follow the steps of the wizard to configure the job.

![](../../.gitbook/assets/kodo-cloud-administration-backup05.png)

### Step 1: General

Enter a job name and schedule description. Click **Next** button to continue.

![](../../.gitbook/assets/kodo-cloud-administration-backup06.png)

### Step 2: Users

Select user or users that should be protected in this backup job. You can also use **Auto-select users** option to automatically protect all users registered in the defined Microsoft 365 organisation.

![](../../.gitbook/assets/kodo-cloud-administration-backup07.png)

### Step 3: Schedule

Create a schedule according to your backup policy. Select the time when the first full backup should start and the cycle in which it will be repeated \(as incremental backup\). You can choose a day\(s\) of a week or other time interval \(week or month\). Set the time the job should start.

![](../../.gitbook/assets/kodo-cloud-administration-backup08.png)

### Step 4: Summary

Verify your job configuration and provide amendments if necessary. Save the job. The job is ready to start.

## What will happen next?

After creation, the job is set by default to the active state.  

When the time set in the job comes the server will generate a task for every selected user. Tasks will be waiting in a queue to be processed by the cloud agent.

