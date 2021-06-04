# Installation Overview

KODO for Cloud can be easily installed on a single box \(it can be a physical or virtual server\). In both cases, the steps you need to follow are basically the same. Before installation prepare your server platform accordingly to the size of your Microsoft 365 organization \(see the [Sizing]() chapter\).

If the system platform is configured and deployment-ready do as follow:

1. Configure [backup destinations]() \(skip this step if you're going to use the Virtual Appliance\).
2. Choose your installation path. You can pick one of the following options:
   * Quick Install \(All-in-One\)
   * ​[Installation using the Ansible playbook​]()
   * [​Installation with RPMs​]()
   * [Virtual Appliance \(VMware\)]()
3. Setup settings in the [KODO Admin]() panel:
   * License 
   * Launching the Cloud Agent
   * Storage Configuration
   * Agent Configuration
4. Add and verify [Microsoft 365 organization]():
   * Configure Microsoft 365 access
   * Add Microsoft 365 organization manually or using the Setup Assistant
   * Create a data policy and assign users and/or sites
   * Create a job  and select users and/or sites
5. Test basic backup & recovery operations to verify that the installation is completed:
   * [Backup]()​ 
   * [Restore]() 

Go to the [Quick Install \(All-In-One\)]() chapter to deploy KODO for Cloud server using installation script.

