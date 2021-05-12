# Small Microsoft  365 organization

For the small Microsoft 365 organization \(up to 50 users\) the following system configuration is recommended:

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
          <li>at least 4 cores</li>
          <li>at least 16 GB RAM</li>
          <li>at least 30 GB disk for operating system binaries system</li>
          <li>at least 30 GB disk for database (/var/lib/mysql directory)</li>
          <li>at least 50 GB disk for KODO software (/opt/kodo-cloud directory)</li>
          <li>storage space for backup</li>
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

It's recommended to configure all disks as LVM disks just to be able to extend their capacity if needed.  

Now you can to the [Deployment](../../deployment/) chapter to choose KODO for Cloud server installation type or go to the next chapter [Medium Microsoft 365 organization](medium.md).

