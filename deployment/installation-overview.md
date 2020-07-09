# Installation Overview

KODO for Cloud can be easily installed on a single box. It can be a physical or a virtual server. In both cases, the steps you need to follow are basically the same. Before intallation prepare you server platform accordingly to the size of Microsoft 365 organization you are going to protect \(see the chapter [Sizing](../planning/sizing/)\).

When you server platform is ready to deployment, do the following:

1. Setup [backup storage](../planning/backup-storage.md).
2. Choose your installation path. You have the following options:
   * [​All-in-one quick installation​](quick-install-all-in-one.md)
   * ​[Installation using Ansible playbook​](installation-using-ansible-playbook.md)
   * [​Installation with RPMs​](installation-with-rpms.md)
   * [Virtual Appliance \(VMware\)](virtual-appliance-vmware.md)
3. Setup settings in [KODO Admin](../administration/settings/kodo-admin.md) panel
   * Email 
   * license 
4. Add and verify [Microsoft 365 organization](common-tasks/microsoft-365-organization-management/)
   * synchronize users
   * assign users to data policy 
   * assign users to job 
5. Test basic backup & recovery operations to verify that the installation is completed:
   * [Backup](../administration/data-backup/on-demand-backup.md)​ 
   * [Restore](../administration/data-restore/) 

