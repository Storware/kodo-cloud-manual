# Installation Overview

KODO for Cloud server can be easily installed on a single box. It can be a physical or virtual server. In both cases, the steps you need to follow are basically the same. Before installation prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the [Sizing](../planning/sizing/) chapter\).

If the system platform is ready to KODO for Cloud server deployment do as follow:

1. Configure [backup destinations ](backup-destination-configuration/) \(skip this step if you're going to use the Virtual Appliance\).
2. Choose your installation path. You can choose one of the following options:
   * [​All-in-one quick installation​](quick-install-all-in-one.md)
   * ​[Installation using Ansible playbook​](installation-using-ansible-playbook.md)
   * [​Installation with RPMs​](installation-with-rpms.md)
   * [Virtual Appliance \(VMware\)](virtual-appliance-vmware.md)
3. Setup settings in the [KODO Admin](../administration/organizations-kodoadmin-dashboard-only/settings/kodo-admin.md) panel:
   * Email information
   * License information 
4. Add and verify [Microsoft 365 organization](first-steps-after-deployment/microsoft-365-organization-management/):
   * synchronize users
   * synchronize sites
   * create a data policy and assign users and/or sites
   * create a job  and select users and/or sites
5. Test basic backup & recovery operations to verify that the installation is completed:
   * [Backup](../administration/data-backup/on-demand-backup.md)​ 
   * [Restore](../administration/data-restore/) 

Go to the next chapter to configure backup and storage space on your KODO for Cloud server.

