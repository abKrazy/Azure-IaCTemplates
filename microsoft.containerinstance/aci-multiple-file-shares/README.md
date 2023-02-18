---
description: This template creates an Azure Container Instance that mounts multiple Azure File shares
page_type: sample
products:
- azure
- azure-resource-manager
urlFragment: aci-multiple-file-shares
languages:
- json
- bicep
---
# Create an Azure Container Instance with multiple volume mounts backed by Azure File shares

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https%3A%2F%2Fraw.githubusercontent.com%2FabKrazy%2FAzure-IaCTemplates%2Fmicrosoft.containerinstance%2Faci-multiple-file-shares%2Fazuredeploy.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FabKrazy%2FAzure-IaCTemplates%2Fmicrosoft.containerinstance%2Faci-multiple-file-shares%2Fazuredeploy.json)

Create an Azure Container Instance that mounts multiple Azure File shares. Currently, ARM/YAML/programmatic method is the only way to mount multiple file shares in an Azure Container Instance - this is not supported from the Azure Portal or Azure CLI. 

This template assumes the following resources are already in place:
**Storage Account**: Storage account for the file share
**File share**: 3 file shares in the above storage account
**Azure Container Registry**: ACI will need to pull the the image from an Azure Container Registry, although the template can be easily modified to pull from another registry.
**Log Analytics Workspace**: Container logs and Container events will be sent to a Log Analytics Workspace that can be queried as shown below:
Sample queries:
ContainerEvent_CL | limit 50
| sort by TimeGenerated desc

ContainerInstanceLog_CL | limit 50
| sort by TimeGenerated desc

Note:
	- After you've deployed the container group, it can take several minutes (up to 10) for the first log entries to appear in the Azure portal.


`Tags: Azure Container Instance, Microsoft.ContainerInstance/containerGroups`

## Solution overview and deployed resources

The following resources are deployed as part of the solution

+ **Azure Container Instance**

## Deployment steps

You can click the "Deploy to Azure" button at the beginning of this document.


