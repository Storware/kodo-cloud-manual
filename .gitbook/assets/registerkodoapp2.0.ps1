<#

.SYNOPSIS
Registering KODO4Cloud application for Office 365

.DESCRIPTION
This script will register KODO4Cloud application in your Office365 organization and will generate values and certificate that you will need to provide in KODO Service configuration, using web admin portal. This will allow KODO to get access to your organization and backup selected data. Script will ask you for credentials of your Office365 organization, you need to provide e-mail and password for administrative account.

.PARAMETER AppName 
Name under which application will be registered in AzureAD. Default: KODO4Cloud.

.PARAMETER KeyName 
Name under which key for application will be registered. Default: KODO4CloudKey.

.PARAMETER KeyExpiresTime 
Time after which the key will expire. Default: 2 years.

.PARAMETER GraphAddress 
Url address of Microsoft Graph service. Default: https://graph.microsoft.com

.PARAMETER HomePage 
Url address of homepage that will be displayed in Application info in AzureAD. Default: https://storware.eu/

.PARAMETER NewCertPath 
Path where generated certificate will be saved. Path must exist. Default: current working directory.

.PARAMETER ExistingPublicCertPath 
Path to existing certificate (DER-Format) that you want to use with KODO4Cloud.

.PARAMETER ExistingPrivateCertPath 
Path to existing private certificate (pfx) that you want to use with KODO4Cloud.

.PARAMETER CertificatPassword 
Password to provided private certificate.

.PARAMETER CertOnly 
Generate certificate only, when you want to generate only certificate for existing configuration

.PARAMETER ObjectID 
To use only with CertOnly parameter. ObjectID of application to which you want to generate certificate.

.EXAMPLE
.\AzureADAppRegistration.ps1

.EXAMPLE
.\AzureADAppRegistraton.ps1 -AppName "KODOBackupOffice365"

#>

param(
	[String]$AppName="KODO4Cloud",
	[String]$HomePage="https://storware.eu/en/",
	[String]$KeyName="KODO4CloudKey",
	[int]$KeyExpiresTime=2,
	[String]$GraphAddress="https://graph.microsoft.com",
	[string] $ExistingPublicCertPath,
	[string] $ExistingPrivateCertPath,
	[String] $NewCertPath,
	[Bool] $CertOnly=$false,
	[String] $CertificatPassword,
	[String]$ObjectID="" )

Add-Type -AssemblyName System.Windows.Forms

$HttpServer = {
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:5566/")
    $listener.Start();

    while ($listener.IsListening) {   
        $context = $listener.GetContext()
        $request = $context.Request

        # Output the request to host
        #Write-Host $request | fl * | Out-String

        # Parse Parameters from url
        $rawUrl = $request.RawUrl

        $Parameters = @{}
        $rawUrl = $rawUrl.Split("?")
        $Path = $rawUrl[0]
        $rawParameters = $rawUrl[1]
        
        if ($request.Url -match '/end$') {break}

        if ($rawParameters) {
                $rawParameters = $rawParameters.Split("&")


                foreach ($rawParameter in $rawParameters) {
                    $Parameter = $rawParameter.Split("=")

                    $Parameters.Add($Parameter[0], $Parameter[1])
                }
            }

        # Create output string (dirty html)
        $output = "<html><body><p>"
        $output = $output + "Path is $Path" + "<br />"
        foreach ($Parameter in $Parameters.GetEnumerator()) {
                $output = $output + "$($Parameter.Name) is equal to $($Parameter.Value)" + "<br />"
        }

        $output = $output + "</p></body></html>"
        
        # Send response
        $statusCode = 200
        $response = $context.Response
        $response.StatusCode = $statusCode    
        $buffer = [System.Text.Encoding]::UTF8.GetBytes($output)
        $response.ContentLength64 = $buffer.Length
        $output = $response.OutputStream
        $output.Write($buffer,0,$buffer.Length)
        $output.Close()
    }

    $listener.Stop()
}
Function GenerateCert
{
	Param (
    [Parameter(Mandatory=$true)] [int] $ExpirationTimeInYears,
    [String] $Password,
	[String] $DestinationDir)

	Write-Host "Generating a self-signed certificate"
	$cert=New-SelfSignedCertificate -Subject "CN=Kodo4Cloud Cert" -KeyAlgorithm RSA -KeyLength 2048 -NotAfter (Get-Date).AddYears($ExpirationTimeInYears) -CertStoreLocation "Cert:\localMachine\My"
	$thumb= $cert.Thumbprint

	if([String]::IsNullOrWhiteSpace($Password))
	{
		[bool]$passDontMatch=$true
		while($passDontMatch)
		{
			$SecurePassword = Read-host "Password to certificate: " -AsSecureString
			$SecurePasswordConfirm = Read-host "Password to certificate: " -AsSecureString
	
			$pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword))
			$pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePasswordConfirm))

			if ( $pwd1_text -ceq $pwd2_text)
			{$passDontMatch=$false} 
			else
			{
			Write-Host "Password don't match"
			$s=[System.Windows.Forms.MessageBox]::Show('Passwords don''t match', 'Warning', 'OK', 'Warning')
			}
		}
	}
	else
	{
		write-host $Password
		$SecurePassword= ConvertTo-SecureString $Password -AsPlainText -Force
	}
	
	$certPath="cert:\localMachine\my\"+$thumb

	$pfxPath=Join-Path -Path $DestinationDir -ChildPath "Kodo4Cloud.pfx"
	$cerPath= Join-Path -Path $DestinationDir -ChildPath "Kodo4Cloud.cer"

	$pfx = Export-PfxCertificate -cert $certPath -FilePath $pfxPath -Password $SecurePassword
	$cer = Export-Certificate -cert $certPath -FilePath $cerPath

	$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
	$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

	$cerPath
    $pfxPath
	$UnsecurePassword
}


Function AddCert
{
	Param(
	[Parameter(Mandatory=$true)][String] $CertPath, 
	[Parameter(Mandatory=$true)][String] $ObjId	)

	Write-Host "Registering certificate as an trusted"
	$cer = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2;
	$cer.Import($CertPath) | out-null

	$bin = $cer.GetCertHash()
	$base64Thumbprint = [System.Convert]::ToBase64String($bin)

	$CertificateInfo = @{} ;
    $CertificateInfo.CustomKeyIdentifier =$base64Thumbprint;
    $CertificateInfo.Value = [System.Convert]::ToBase64String($cer.GetRawCertData()) ;
    $CertificateInfo.EndDate = $cer.NotAfter ;
    $CertificateInfo.Type = "AsymmetricX509Cert"
    $CertificateInfo.Usage = "Verify" ;
    $CertificateInfo.ObjectId = $ObjId ;
    $CertificateInfo.CustomKeyIdentifier
    
	$result= New-AzureADApplicationKeyCredential @CertificateInfo;
}

Function PfxToBase64
{
	Param([Parameter(Mandatory=$true)][String] $CertPath)

	$fileContentBytes = get-content $CertPath -Encoding Byte
	$base64Cert= [System.Convert]::ToBase64String($fileContentBytes) 
	$base64Cert
}


Function ExportPfxToBase64File
{
	Param([Parameter(Mandatory=$true)][String] $ExistingPfxCertPath)

	$fileContentBytes = get-content $ExistingPfxCertPath -Encoding Byte
	[System.Convert]::ToBase64String($fileContentBytes) | Out-File ‘Kodo4Cloud.txt’
}

Function ExportPfxToBase64
{
	Param([Parameter(Mandatory=$true)][String] $ExistingPfxCertPath)

	$fileContentBytes = get-content $ExistingPfxCertPath -Encoding Byte
	[System.Convert]::ToBase64String($fileContentBytes)
}

"Registering KODO4Cloud application for Office 365
Storware KODO4Cloud PowerShell ver. 2.0"

if (-not (Get-Module -ListAvailable -Name AzureAD)) 
{
	Write-Host "Module AzureAD is required to continue... press any key to install AzureAD module"
	Install-Module AzureAD -Force
}


#validation
if($AppName.Length -gt 256)
{
	throw "Application name is to long, maximum length is 256 characters "
}

if( ($HomePage.StartsWith("https://") -or $HomePage.StartsWith("http://")) -eq $false)
{
	throw "HomePage must begin with https:// or http://"
}

if($HomePage.Length -gt 255)
{
	throw "HomePage is limited to 255 characters in length"
}

if($KeyName.Length -gt 16)
{
	throw "KeyName is limited to 16 characters in length"
}

if(-not [String]::IsNullOrWhiteSpace($ExistingPublicCertPath))
{
	if(-not([System.IO.File]::Exists($ExistingPublicCertPath)))
	{
		throw "Cannot find certificate file" 
	}
}
#validation

	Write-Host "Login to AzureAD"
	$creds=Connect-AzureAD 


	$KodoSett=New-Object KodoSettings
	$KodoSett.TenantId=$creds.TenantId
	$KodoSett.AppName=$AppName
	$KodoSett.HomePage=$HomePage
	$KodoSett.KeyName=$KeyName
	$KodoSett.GraphAddress=$GraphAddress


if(!$CertOnly)
{
	$TenantDomain=$creds.TenantDomain
	$IdentifierUris="https://"+$TenantDomain+"/"+[Guid]::NewGuid()

	Write-Host "Registering KODO4Cloud application"
	$daemonApplication = New-AzureADApplication -DisplayName $KodoSett.AppName -HomePage $KodoSett.HomePage -IdentifierUris $IdentifierUris -ReplyUrls "http://localhost:5566"
	$KodoSett.ClientID=$daemonApplication.AppId

	#=============Graph Permissions========================
	$req = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
	$acc1 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "df021288-bdef-4463-88db-98f22de89214","Role"
	$acc2 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "75359482-378d-4052-8f01-80520e7db3cd","Role"
	$acc3 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "332a536c-c7ef-4017-ab91-336970924f0d","Role"
	$acc4 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "810c84a8-4a9e-49e6-bf7d-12d183f40d01","Role"
	$acc5 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "e2a3a72e-5f79-4c64-b1b1-878b674786c9","Role"
	$acc6 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "ef54d2bf-783f-4e0f-bca1-3210c0444d99","Role"
	$acc7 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "6918b873-d17a-4dc1-b314-35f528134491","Role"

	$req.ResourceAccess = $acc1,$acc2,$acc3,$acc4, $acc5, $acc6,$acc7
	$req.ResourceAppId = "00000003-0000-0000-c000-000000000000" #Microsoft Graph   

	#=============AzureAD Permissions========================
	$azureAD_req = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
	$AAD_acc1 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "5778995a-e1bf-45b8-affa-663a9f3f4d04","Role"
	$AAD_acc2 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "311a71cc-e848-46a1-bdf8-97ff7156d8e6","Scope"

	$azureAD_req.ResourceAccess = $AAD_acc1,$AAD_acc2
	$azureAD_req.ResourceAppId = "00000002-0000-0000-c000-000000000000" #Azure AD   

	#=============Exchange Permissions========================
	$exchange_req = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
	$EWS_acc1 = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "dc890d15-9560-4a4c-9b7f-a736ec74ec40","Role"

	$exchange_req.ResourceAccess = $EWS_acc1
	$exchange_req.ResourceAppId = "00000002-0000-0ff1-ce00-000000000000" #Exchange 
	Set-AzureADApplication -ObjectId $daemonApplication.ObjectId  -RequiredResourceAccess $req,$azureAD_req,$exchange_req 

	$now=[System.DateTime]::Now
	$expirationDate=$now.AddYears($KeyExpiresTime)
	$passwordCredential = New-AzureADApplicationPasswordCredential -ObjectId $daemonApplication.ObjectId -StartDate $now -EndDate $expirationDate -CustomKeyIdentifier $KeyName
	$KodoSett.ClientSecret=$passwordCredential.Value

	$ObjectID=$daemonApplication.ObjectId
}

if($CertOnly -and [string]::IsNullOrEmpty($ObjectID))
{
	$ObjectID = Read-host "Insert application ObjectID: "
}

if([String]::IsNullOrWhiteSpace($ExistingPublicCertPath))
{	
	if([String]::IsNullOrWhiteSpace($NewCertPath))
	{
		$NewCertPath=$PWD.Path
	}
    $generationResult=GenerateCert -ExpirationTimeInYears 2 -DestinationDir $NewCertPath $CertificatPassword
	$ExistingPublicCertPath=$generationResult[0]
	$ExistingPrivateCertPath=$generationResult[1]
	$CertificatPassword=$generationResult[2]
}

	AddCert $ExistingPublicCertPath $ObjectID | Out-Null

if([String]::IsNullOrEmpty($ExistingPrivateCertPath))
{
	$ExistingPrivateCertPath= Read-host "Insert path to private certificate(*.pfx) "
}

if([String]::IsNullOrWhiteSpace($CertificatPassword))
{
	$SecurePassword = Read-host "Password to certificate: " -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    $CertificatPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
}

    $KodoSett.CertPassword=$CertificatPassword
	$KodoSett.CertBase64= ExportPfxToBase64 $ExistingPrivateCertPath

	$JsonSettings=ConvertTo-Json -InputObject $KodoSett 
	$JsonSettings >> ".\KodoADSettings.json"

	$jsonPath=$PWD.Path+"\KodoADSettings.json"

if(!$CertOnly)
{
	Write-Host ""
	Write-Host "Application registration name: " $KodoSett.AppName
	Write-Host "Client ID: " $KodoSett.ClientID
	Write-Host "Client Secret: " $KodoSett.ClientSecret
	Write-Host "Tenant ID: " $KodoSett.TenantId
	Write-Host ""

	if(-not ([String]::IsNullOrWhiteSpace($KodoSett.ClientID)))
	{Write-Host "KODO4Cloud application registered successfully!"}
}

Write-Host ""
Write-Host "PFX location:  " $ExistingPrivateCertPath
Write-Host "CER location:  " $ExistingPublicCertPath
Write-Host "JSON location: " $jsonPath

#Start HTTP Server as separate process
#$serverJob = Start-Job $HttpServer

########
#$consentUrl = "https://login.microsoftonline.com/$($kodoSett.TenantId)/adminconsent?client_id=$($kodoSett.ClientID)"
#Start-Process -FilePath $consentUrl
########


Write-Host ""
Write-Host "We are almost ready to send configuration to KODO server! Now you need to login to azure portal and grant permissions for the KODO4CLOUD application:"
Write-Host "1. Go to https://portal.azure.com and login with your administrative account"
Write-Host "2. Click 'Azure Active Directory' from main menu, next 'App registration', next 'View all application'"
Write-Host "3. Click on 'KODO4CLOUD' application (APP ID: $($kodoSett.ClientID)"
Write-Host "4. Click 'Settings', next 'Required permissions' and click 'Grant permissions'"
Write-Host ""
Read-Host "When all steps are done press Enter to continue. We will ask you for your KODO login and password to send configuration to server."
 
#$url = Read-Host -Prompt "Server url"
$url = "https://kodo-demo.storware.eu"
$admin = Read-Host -Prompt "KODO Login"
$passs = Read-Host -Prompt "KODO Password" -AsSecureString
$configname = Read-Host -Prompt "Configuration name"

$pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($passs))

#Write-Host $pass

$body = @{
    password = "$($pass)";
    userName = "$($admin)";
}

$jsonbody = $body | ConvertTo-Json

$res = (Invoke-WebRequest -Uri ($url + "/api/admin/login") -Method Post -Body $jsonbody  -ContentType "application/json" -SessionVariable adminSession -UseBasicParsing)

$res = (Invoke-WebRequest -Uri ($url + "/api/admin/services") -Method Get -ContentType "application/json"  -WebSession $adminSession -UseBasicParsing)

$json = ConvertFrom-Json -InputObject $res.Content

foreach ($elem in $json) {
    if($elem.name -eq "OFFICE365") {
        $o365guid = $elem.guid 
    } 
}

$res = (Invoke-WebRequest -Uri ($url + "/api/admin/services/$($o365guid)") -Method Get -ContentType "application/json"  -WebSession $adminSession -UseBasicParsing)


$json = ConvertFrom-Json -InputObject $res.Content

For ($i=0; $i -lt $json.settingKeys.Count; $i++)
{
    if($json.settingKeys[$i].name -eq "TenantId") { $tenantid_guid = $json.settingKeys[$i].guid } 
    elseif($json.settingKeys[$i].name -eq "ClientSecret") { $clientsecret_guid = $json.settingKeys[$i].guid } 
    elseif($json.settingKeys[$i].name -eq "Certificate Password") { $certificatepassword_guid = $json.settingKeys[$i].guid } 
    elseif($json.settingKeys[$i].name -eq "Private Certificate") { $privatecertificate_guid = $json.settingKeys[$i].guid } 
    elseif($json.settingKeys[$i].name -eq "ClientId") { $clientid_guid = $json.settingKeys[$i].guid } 
}

#Write-Host  $tenantid_guid $clientsecret_guid $certificatepassword_guid $privatecertificate_guid $clientid_guid

$config= @"
{
  "service" : {
    "name" : "OFFICE365",
    "guid" : "$($o365guid)"
  },
  "settings" : [ {
    "value" : "$($kodoSett.CertPassword)",
    "key" : {
      "name" : "Certificate Password",
      "guid" : "$($certificatepassword_guid)"
    }
  }, {
    "value" : "$($kodoSett.ClientID)",
    "key" : {
      "name" : "ClientId",
      "guid" : "$($clientid_guid)"
    }
  }, {
    "value" : "$($kodoSett.CertBase64)",
    "key" : {
      "name" : "Private Certificate",
      "guid" : "$($privatecertificate_guid)"
     }
  },  {
    "value" : "$($kodoSett.TenantId)",
    "key" : {
      "name" : "TenantId",
      "guid" : "$($tenantid_guid)"
     }
  },   {
    "value" : "$($kodoSett.ClientSecret)",
    "key" : {
      "name" : "ClientSecret",
      "guid" : "$($clientsecret_guid)"
     }
  } ],
  "name" : "$($configname)"
}
"@

$res = (Invoke-WebRequest -Uri ($url + "/api/admin/service-configs") -Method Post -ContentType "application/json" -Body $config -WebSession $adminSession -UseBasicParsing)

Write-Host "Configuration sent!"

#try { $result = Invoke-WebRequest -Uri "http://localhost:5566/end"} catch { Write-Host "Bye bye..."}



class KodoSettings
{
[String]$AppName
[String]$ClientSecret
[String]$ClientID
[String]$KeyName
[String]$HomePage
[String]$TenantId
[String]$GraphAddress
[String]$CertBase64
[String]$CertPassword
}