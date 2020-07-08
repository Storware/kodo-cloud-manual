# Platform Requirements

## Platform Requirements

<table>
  <thead>
    <tr>
      <th style="text-align:left">Component</th>
      <th style="text-align:left">Hardware Requirements</th>
      <th style="text-align:left">Software Requirements</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">KODO for Cloud</td>
      <td style="text-align:left">
        <ul>
          <li>at least 4 vCPUs</li>
          <li>at least 16 GB RAM</li>
          <li>at least 300 GB for database</li>
          <li>at least 100 GB for /opt</li>
        </ul>
      </td>
      <td style="text-align:left">
        <ul>
          <li>RHEL 8.x</li>
          <li>CentOS 8.x</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

{% hint style="warning" %}
Before the KODO for Cloud install, please make sure your OS is up-to-date. Use **dnf update** \(or **yum update**\) command if needed. Reboot your OS afterwards. 
{% endhint %}

An [Active Red Hat subscription](https://access.redhat.com/management/products) is required for registering the [RHEL 8](https://www.itzgeek.com/tag/rhel-8) systems or you can [sign up for 30 days trial](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) which will allow you to download Red Hat Enterprise Linux 8 as well as register your RHEL 8 system with Red Hat for receiving packages and updates.

Keep your Red Hat subscription credentials handy for registering your RHEL 8 system to Red Hat.

## Ports used for communication

| Component | To | Port |
| :--- | :--- | :--- |
| api-core | MySQL database | 3306\* |
| Cloud Agent | api-core | 443 |
| Cloud Agent | Microsoft 365 | 443, 80 |

_\* - default port number  
\*\* - default port number for the client and administrative communication_

