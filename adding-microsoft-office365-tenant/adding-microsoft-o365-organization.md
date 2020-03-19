# Adding Microsoft O365 Organization

Before starting to work with data, KODO first need to get access to your Microsoft Office365 Organization.

Access to data is performed via application installed in you organization. 

{% hint style="info" %}
KODO does not store your O365 administrative id or password
{% endhint %}

## Adding organization using PowerShell script

Follow instruction to register KODO4Cloud application and add O365 organization to KODO:

Download PowerShell script:

{% file src="../.gitbook/assets/registerkodoapp2.0.ps1" caption="Download PS script" %}

Log in to Windows system and as an administrator run downloaded PowerShell script.

![](../.gitbook/assets/image%20%2810%29.png)

Script will ask you for your TenantID which can by ID or domain name, e.g.: kodo4cloud.onmicrosoft.com. After providing TenantID Azure Active Directory window will be displayed, please provide your administrative login and password \(AzureAD\) to register KODO4Cloud application.

![](../.gitbook/assets/image%20%2825%29.png)



Script will register KODO4Cloud application and display necessary information that you will need to provide in your KODO organization configuration:

* **Tenat ID**
* **Client ID**
* **Client Secret**
* **Certificate for Exchnage Online connection**

**You will also find all those values in KodoADSettings.json file that is created by script in location from where you run script. You will need this file to copy those values to KODO configuration in next step.**

After successful application registration you need to log in to your Azure portal \([https://portal.azure.com](https://portal.azure.com)\) and set up correct permissions for KODO4Cloud app.

1. Select "Azure Active Directory" item from the main menu
2. Next go to the "App registration"
3. Click on the application name
4. Click on "All settings-&gt;" 
5. Select "Required Permissions"
6. Click on "Grant Permissions"

