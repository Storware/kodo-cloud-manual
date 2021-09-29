# Installation with RPMs

Before starting the installation process you have to prepare your server platform accordingly to the size of the Microsoft 365 organization you are going to protect \(see the [Sizing Guide](https://storware.gitbook.io/kodo-for-cloud-office365/overview/sizing-guide)\).

Follow the steps to prepare your system platform prior to deployment:

1. Configure a backup storage destination. Follow the instructions in the [Backup destinations](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/backup-destinations) chapter.
2. Login to the Make sure your operating system is up-to-date by the following command:

   ```text
   # yum -y update
   ```

   After the kernel is updated, reboot the operating system.

3. Install Kodo for Cloud repository:

   * create file `/etc/yum.repos.d/kodo.repo`  \(e.g.`touch /etc/yum.repos.d/kodo.repo` \)
   * open the created file \(using e.g. vi editor \) and insert  the information from the box below to the file:

   ```text
   # Kodo for Cloud Microsoft 365 backup solution repository
   [kodo]
   name = Kodo Cloud
   baseurl = http://repo.storware.eu/kodo-cloud/current/el8
   gpgcheck=0
   ```

   * optionally  `current` can also be pointed to the specific version, e.g. `4.2` \(not the one that is always up to date\), e.g.`http://repo.storware.eu/kodo-cloud/4.2/el8`

4. Install MariaDB repository:
   * generate.repo file at [MariaDB download](https://downloads.mariadb.org/mariadb/repositories) site:
     * Choose a Distro \(e.g. `CentOS` \)
     * Choose a Release \(e.g. `CentOS 8 (x86_64)` \)
     *  ****Choose a Version \(e.g.`10.4 [Old Stable]`\)
   * create file `/etc/yum.repos.d/MariaDB.repo`  \(e.g.`touch /etc/yum.repos.d/MariaDB.repo)`
   * copy and paste generated repo file into `/etc/yum.repos.d/MariaDB.repo`, so it may  look similar to this one below \(this one for CentOS/RHEL 8\):

     ```text
     # MariaDB 10.4 CentOS repository list - created 2020-06-01 16:14 UTC
     # http://downloads.mariadb.org/mariadb/repositories/
     [mariadb]
     name = MariaDB
     baseurl = http://yum.mariadb.org/10.4/centos8-amd64
     module_hotfixes = 1
     gpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
     gpgcheck = 1
     ```
5. Install Microsoft repository:
   * create file`/etc/yum.repos.d/Microsoft.repo (e.g. touch /etc/yum.repos.d/Microsoft.repo)`
   * open the created file \(using e.g. vi editor \) and insert  the information from the box below:

     ```text
     # Microsoft repository
     [Microsoft]
     name = Microsoft
     baseurl = https://packages.microsoft.com/rhel/7/prod
     gpgkey = https://packages.microsoft.com/keys/microsoft.asc
     gpgcheck = 1
     ```

## KODO for Cloud server

KODO for Cloud consists of the server \(central management point with web UI\) and the agent \(cloud agent\), which can be installed on the same server or on any dedicated server if needed. The first step is always the server installation.

Follow the steps to install KODO for Cloud server using rpm packages:

1. Install  the server using `yum` command:

   ```text
   # yum -y install kodo-cloud-server
   ```

2. When the installation process is finished,  start and enable **MariaDB** service using the command below:

   ```text
   # systemctl start mariadb
   # systemctl enable mariadb
   ```

3. Run **MariaDB** script for secure installation \(choose the options as shown\):

   ```text
   # mysql_secure_installation

   Switch to unix_socket authentication [Y/n] y
   Change the root password? [Y/n] n
   Remove anonymous users? [Y/n] y
   Disallow root login remotely? [Y/n] y
   Remove test database and access to it? [Y/n] y
   Reload privilege tables now? [Y/n] y
   ```

4. Initialize Kodo for Cloud server database using script - you need to provide DB root password:

   ```text
   #/opt/kodo-cloud/server/bin/kodo-cloud-server-init.sh --dbrootpassword YOUR_DB_ROOT_PASSWORD
   ```

5.  Start and enable KODO for Cloud server service \(it can take around a minute for the server to be started\):

   ```text
   #systemctl start kodo-cloud-server
   #systemctl enable kodo-cloud-server
   ```

6. If you don't have a firewall running yet - start and enable its service:

   ```text
   #systemctl start firewalld
   #systemctl enable firewalld
   ```

7. Open the 8181 port on your firewall. Here is an example:

   ```text
   #firewall-cmd --add-port=8181/tcp --permanent
   #firewall-cmd --complete-reload
   ```

8. Now you should be able to log into the web console using the URL: `https://KODO_SERVER_HOST:8181`, where `KODO_SERVER_HOST` is the hostname or IP address of your Kodo for Cloud server. To be able to perform backup tasks you have to install the KODO cloud agent.  Go to the **KODO for Cloud agent** paragraph to proceed.  

{% hint style="info" %}
KODO for Cloud server credentials are described in the chapter [Kodoadmin vs KODO Organization admin](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/initial-configuration/kodoadmin-vs-kodo-organization-admin)
{% endhint %}

## KODO for Cloud Agent

Kodo Cloud Agent is the component that performs backup and restore tasks. You can install it on the same host as the KODO for Cloud server was installed or you can install it on another dedicated server.         

Follow the steps below to install KODO for Cloud agent using rpm packages:                                                                                     

1. Install the **libunwind** rpm package \(the package can be downloaded from the URL: [http://repo.storware.eu/kodo-cloud/current/el8.2/libunwind-1.3.1-3.el8.x86\_64.rpm](http://10.40.0.253/kodo-cloud/current/el8.2/libunwind-1.3.1-3.el8.x86_64.rpm)\). Upload the package to KODO for Cloud server to a **upload\_path** of your choice.  

   ```text
   #rpm -ivh  /upload_path/libunwind-1.3.1-3.el8.x86_64.rpm
   ```

2. Install Cloud Agent using **yum** command:

   ```text
   #yum -y install kodo-cloud-agent
   ```

3. Register agent to the server with `AGENT_NAME` of your choice

   * syntax:

   ```text
   #/opt/kodo-cloud/agent/bin/cloudagent.sh -s SERVER_HOST:SERVER_PORT -n AGENT_NAME
   ```

   * example:

   ```text
   #/opt/kodo-cloud/agent/bin/cloudagent.sh -s localhost:8181 -n voyager
   ```

4. Start and enable Kodo Cloud Agent service using the agent name at the end of the service name.

   * syntax:

   ```text
   #systemctl start cloud-agent-AGENT_NAME
   #systemctl enable cloud-agent-AGENT_NAME
   ```

   * example:

   ```text
   #systemctl start cloud-agent-voyager
   #systemctl enable cloud-agent-voyager
   ```

Go to the [Backup destinations](https://storware.gitbook.io/kodo-for-cloud-office365/deployment/backup-destinations) section to configure storage for backups.

