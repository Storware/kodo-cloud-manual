# Very large Microsoft 365 organization

For a very large Microsoft 365 organization \(1000+ users\) the following system configuration is recommended:

<table>
  <thead>
    <tr>
      <th style="text-align:left">Component</th>
      <th style="text-align:left">OS platform requirements</th>
      <th style="text-align:left">Supported OS platforms</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">Kodo for Cloud</td>
      <td style="text-align:left">
        <ul>
          <li>at least 8 cores</li>
          <li>at least 32 GB RAM</li>
          <li>at least 30 GB disk for operating system binaries</li>
          <li>at least 1 TB for database (/var/lib/mysql directory)</li>
          <li>at least 100 GB for KODO software (/opt/kodo-cloud directory)</li>
          <li>storage space for backup (ready to be configured as a regular filesystem
            or the VDO device)</li>
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

{% hint style="danger" %}
The storage space required to store backup data depends on the amount of data your organization is currently utilizing plus some overhead for the future data increase.

You can check the current storage usage of your Microsoft 365 organization by log in to the following URL as the administrator user of your organization:

[https://admin.microsoft.com/Adminportal/Home/\#/reportsUsage](https://admin.microsoft.com/Adminportal/Home/#/reportsUsage)
{% endhint %}

It's recommended to configure all disks as LVM devices just to be able to extend their capacity if needed. 

Go to the [Deployment](../../deployment/) chapter to choose KODO for Cloud server installation type.

