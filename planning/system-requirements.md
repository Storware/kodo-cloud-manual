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
          <li>at least 2 vCPUs</li>
          <li>at least 8GB RAM</li>
          <li>at least 50GB for database</li>
          <li>at least 10GB for /opt</li>
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

## Ports used for communication

| Component | To | Port |
| :--- | :--- | :--- |
| api-core | MySQL database | 3306\* |
| Cloud Agent | api-core | 443 |
| Cloud Agent | Microsoft 365 | 443, 80 |

_\* - default port number  
\*\* - default port number for the client and administrative communication_

