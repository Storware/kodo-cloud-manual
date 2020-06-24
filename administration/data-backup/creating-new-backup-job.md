# Scheduled Backup

Follow instruction to create a new backup job:

1. Go to the "Jobs" view 
2. Click **Create** Job Button
3. Follow the steps of the wizard

![Create job button in Tasks view](../../.gitbook/assets/image.png)

## General

Specify job name, you can also add description.

![Wizard step 1](https://github.com/Storware/kodo-cloud-manual/tree/6ce1c059a7e8a80d54e1a6fff60815797cf17a9a/.gitbook/assets/image%20%2829%29.png)

## Features

Select what we should protect.

![](../../.gitbook/assets/image%20%288%29.png)

## Users

Select user that should be protected by this backup job. You can also use **Auto-select users** option to automatically protect all users registered in KODO.

## Schedule

On this screen you can select when first backup should occur and the cycle in which it is to be repeated.

## Summary

Verify job configuration and provide amendments if necessary. Save the job.

## What will happen next?

At the set, in job, time and date server will generate task for every selected user and feature. Tasks will be waiting in the queue to be processed by agent.

