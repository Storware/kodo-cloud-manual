# Installation Overview

KODO for Cloud can be easily installed on a single box. It can be a physical or a virtual server. In both cases, the steps you need to follow are basically the same. Before intallation prepare you server platform accordingly to the size of Microsoft 365 organization you are going to protect \(see the chapter [Sizing](../planning/sizing/)\).

When the server platform is ready to deployment, do as following:

1. Configure [backup and stage space.](staging-space-and-backup-destination-configuration.md)
2. Choose your installation path. You have the following options:
   * [​All-in-one quick installation​](quick-install-all-in-one.md)
   * ​[Installation using Ansible playbook​](installation-using-ansible-playbook.md)
   * [​Installation with RPMs​](installation-with-rpms.md)
   * [Virtual Appliance \(VMware\)](virtual-appliance-vmware.md)
3. Setup settings in [KODO Admin](../administration/settings/kodo-admin.md) panel:
   * Email information
   * license 
4. Add and verify [Microsoft 365 organization](microsoft-365-organization-management/):
   * synchronize users
   * assign users to data policy 
   * assign users to job 
5. Test basic backup & recovery operations to verify that the installation is completed:

   * [Backup](../administration/data-backup/on-demand-backup.md)​ 
   * [Restore](../administration/data-restore/) 

{% hint style="info" %}
KODO for Cloud has one global admin \(admin managing organizations\) account and  one account in the default organization by default:

* Kodo admin \(global admin\): `kodoadmin` with password `Kodo@dm1n` 
* default organization admin: `admin` with password `Kodo@dm1n`
{% endhint %}

Go th the next chapter to configure backup and storage space on your server.

