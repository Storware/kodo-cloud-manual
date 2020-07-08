# Sizing

There are two kinds of people: those who make backups and those who will make them. But just doing  backups is not enough. To avoid unnecessary surprises, the best strategy is to plan your backup environment/procedure **before implementing** it. In this chapter we have gathered general tips and tutorials that you may find useful when thinking about implementing **KODO for Cloud**.

Many factors may affect your final deployment, but it's a good practice to answer following questions:

1. **What?**
   * What type of Microsoft 365 services you want to protect \(Exchange Online Mailbox, Calendars, Contacts, OneDrive\)? 
   * How big is the volume of your data? 
2. **Where?**
   * Where will you store your backups? Is it enough to use a simple \(or deduplicated\) dedicated filesystem \(separated from production environment\) or maybe you need more efficient backup destination.
3. **When?**
   * What is the best time to take backups? The most standard approach is to have backup window during the night \(for example 12 hours between 6:00 p.m. and 6:00 a.m.\). Depending on the volume of your data, you might consider adjusting it to suit your needs.

When you take the above questions into consideration you should have at least a good starting point to plan your backup strategy.

Based on the above, we prepared three scenarios which are typical for most use cases.

