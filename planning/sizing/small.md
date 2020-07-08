# Small Microsoft  365 organization

For the small Microsoft 365 organization \(up to 50 users\) the following system configurtation is recommended:

<table>
  <thead>
    <tr>
      <th style="text-align:left">Component</th>
      <th style="text-align:left">Hardware Reqiurements</th>
      <th style="text-align:center">Supported OS platforms</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Kodo for Cloud</td>
      <td style="text-align:left">
        <ul>
          <li>at least 4 cores</li>
          <li>at least 16 GB RAM</li>
          <li>at least 30 GB for database</li>
          <li>at least 50 GB for /opt/kodo-cloud</li>
          <li>space for backup</li>
        </ul>
      </td>
      <td style="text-align:center">
        <ul>
          <li>RHEL 8.x</li>
          <li>CentOS 8.x</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

One Cloud Agent is capable to run 25 tasks in parallel. If you need to configure another Cloud Agent instance you have to add additional 4GB of RAM and 2 vCPU to your system configuration.

{% hint style="warning" %}
When installing KODO for Cloud on RHEL 8 it is recomended to have active Red Hat subscription. Use **yum repolist** command to check it.
{% endhint %}

![](../../.gitbook/assets/kodo-cloud-planning-sizing01.jpg)

An [Active Red Hat subscription](https://access.redhat.com/management/products) is required for registering the [RHEL 8](https://www.itzgeek.com/tag/rhel-8) systems or you can [sign up for 30 days trial](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux) which will allow you to download Red Hat Enterprise Linux 8 as well as register your RHEL 8 system with Red Hat for receiving packages and updates.

Keep your Red Hat subscription credentials handy for registering your RHEL 8 system to Red Hat.

