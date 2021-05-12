# Sizing Guide

There are two kinds of people: those who make backups and those who will make them. But just doing backups is not enough. To avoid unnecessary surprises, the best strategy is to plan your backup environment/procedure **before implementing** it. In this chapter, we have gathered general tips and tutorials that you may find useful when thinking about implementing **KODO for Cloud**.

Many factors may affect your final deployment, but it's a good practice to answer the following questions:

1. **What?**
   * What type of Microsoft 365 services you want to protect \(Exchange Online Mailboxes, Exchange Online Archives, Calendars, Contacts, OneDrive files, and SharePoint Online\)? 
   * How big is the volume of your data? 
2. **Where?**
   * Where will you store your backups? Is it enough to use a simple \(or deduplicated\) dedicated filesystem \(separated from the production environment\) or maybe you need a more efficient backup destination?
3. **When?**
   * What is the best time to take backups? The most standard approach is to have a backup window during the night \(for example 12 hours between 6:00 p.m. and 6:00 a.m.\). Depending on the volume of your data, you might consider adjusting it to suit your needs.

When you take the above questions into consideration you should have at least a good starting point to plan your backup strategy.

{% hint style="warning" %}
When installing KODO for Cloud on RHEL 8 it is recommended to have an active Red Hat subscription. Use **yum repolist** command to check it.
{% endhint %}

![](../../.gitbook/assets/kodo-cloud-planning-sizing01.jpg)

Based on the above, we prepared four configurations that are typical for most use cases.



