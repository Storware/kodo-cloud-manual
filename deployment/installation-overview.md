# Installation Overview

KODO for Cloud server can be easily installed on a single box \(it can be a physical or virtual server\). In both cases, the steps you need to follow are basically the same. Before installation prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the [Sizing](../planning/sizing/) chapter\).

If the system platform is configured and deployment-ready do as follow:

1. Configure a system platform tailored to the size of your Microsoft 365 organization.
2. Configure [backup destinations ](backup-destination-configuration/) \(skip this step if you're going to use the Virtual Appliance\).
3. Choose your installation path. You can choose one of the following options:
   * [​All-in-one quick installation​](quick-install-all-in-one.md)
   * ​[Installation using the Ansible playbook​](installation-using-ansible-playbook.md)
   * [​Installation with RPMs​](installation-with-rpms.md)
   * [Virtual Appliance \(VMware\)](virtual-appliance-vmware.md)
4. Setup settings in the [KODO Admin](../administration/organizations-kodoadmin-dashboard-only/settings/kodo-admin.md) panel:
   * Email information
   * License information 
5. Add and verify [Microsoft 365 organization](first-steps-after-deployment/microsoft-365-organization-management/):
   * synchronize users
   * synchronize sites
   * create a data policy and assign users and/or sites
   * create a job  and select users and/or sites
6. Test basic backup & recovery operations to verify that the installation is completed:
   * [Backup](../administration/data-backup/on-demand-backup.md)​ 
   * [Restore](../administration/data-restore/) 

Go to the [Quick Install \(All-In-One\)](quick-install-all-in-one.md) chapter to install KODO for Cloud server using installation script.

