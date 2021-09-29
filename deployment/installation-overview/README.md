# Installation Overview

KODO for Cloud can be easily installed on a single box \(it can be a physical or virtual server\). In both cases, the steps you need to follow are basically the same. Before installation prepare your server platform accordingly to the size of your Microsoft 365 organization \(see the [Sizing Guide](https://storware.gitbook.io/kodo-for-cloud-office365/overview/sizing-guide)\).

If the system platform is configured and deployment-ready do as follow:

1. Configure [backup destinations](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/backup-destinations) \(skip this step if you're going to use the Virtual Appliance\).
2. Choose your installation path. You can pick one of the following options:
   * [Quick Install \(All-in-One\)](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-overview/quick-install-all-in-one)
   * ​[Installation using the Ansible playbook​](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-overview/installation-using-the-ansible-playbook)
   * [​Installation with RPMs​](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-overview/installation-with-rpms)
   * [Virtual Appliance \(VMware\)](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-overview/virtual-appliance-vmware)
3. Setup settings in the [KODO Admin](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration) panel:
   * [License](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/license) 
   * [Launching the cloud agent](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/launching-the-cloud-agent)
   * [Storage configuration](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/storage-configuration)
   * [Agent configuration](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/agent-configuration)
4. Add and verify [Microsoft 365 organization](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/microsoft-365-organization-management):
   * [Configure Microsoft 365 access](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/microsoft-365-organization-management/configure-microsoft-365-access)
   * Add Microsoft 365 organization [manually](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/microsoft-365-organization-management/add-microsoft-365-organization-manually) or using the [Setup Assistant](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/microsoft-365-organization-management/add-microsoft-365-organization-using-the-setup-assistant)
5. Configure & test basic backup/recovery operations to verify that the installation is completed:
   * [Create a data policy and assign users and/or sites](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodo-organization-admin-guide/policies)
   * [Create a job and select users and/or sites](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodo-organization-admin-guide/jobs)
   * Test [Backup](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodo-organization-admin-guide/protection/backup)
   * Test [Restore](https://storware.gitbook.io/kodo-for-cloud-office365/administration/kodo-organization-admin-guide/protection/restore)

Go to the [Quick Install \(All-In-One\)](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/installation-overview/quick-install-all-in-one) chapter to deploy KODO for Cloud server using installation script.

