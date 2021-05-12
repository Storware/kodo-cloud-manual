# Administration access levels

KODO system has two administration access levels implemented by default: 

* **KODO administration level** - accessed through KODO Admin Portal
* **KODO organization administration level** - accessed through KODO organization portal

### Default login credentials

{% hint style="info" %}
KODO for Cloud has by default one global admin account \(admin that manages organizations\) and one account in the default organization :

* Kodo admin \(global admin\): `kodoadmin`with password`Kodo@dm1n` 
* default organization admin: `admin`with password`Kodo@dm1n`
{% endhint %}

## KODO administration level

KODO administrator level is the highest level of authority. By logging into the system with this authorization level you will log into KODO Admin Portal. KODO Admin Portal allows you to configure the following resources:

* Administrators \(global and organizations administrators\) 
* Organizations
* Agent configs
* Agents
* Storage
* Settings

## KODO organization administration level

The administrator can create multiple organizations at one KODO for Cloud server. Every configured organization is a separate entity with separated data, users, jobs, policies, etc.  
By logging into KODO organization portal as the organization administrator you are allowed to configure the following resources:

* Jobs
* Policies
* Settings

The default organization is named **My organization** and it is created during  KODO for Cloud server installation.

The credentials will be needed later on to log in to KODO for Cloud server.

