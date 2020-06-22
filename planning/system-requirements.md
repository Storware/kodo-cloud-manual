# Platform Requirements

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
          <li>at least 4 processor cores</li>
          <li>at least 24GB RAM</li>
          <li>at least 50GB for database</li>
          <li>at least 10GB for /opt</li>
        </ul>
      </td>
      <td style="text-align:left">
        <ul>
          <li>RHEL 7.x</li>
          <li>CentOS 7.x</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

# Ports used for communication

| Component | To | Port |
| :--- | :--- | :--- |
| api-core | Backup engine \(IBM Spectrum Protect\) | 1500\*\* |
| api-core | MySQL database | 3306\* |
| api-core | RabbitMQ | 5672\* |
| KODO4Cloud Agent | api-core | 443 |
| KODO4Cloud Agent | Microsoft Office365 | 443, 80 |
| KODO4Cloud Agent | RabbitMQ | 5672\* |

_\* - default port number  
\*\* - default port number for client and administrative communication_
