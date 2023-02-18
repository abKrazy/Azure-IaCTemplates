param location string = resourceGroup().location
param aciResourceName string
param containerRegistryName string
@secure()
param containerRegistryPassword string
param imageName string
@secure()
param secretEnvValue string
param storageAccountName string
@secure()
param storageAccountKey string
param fileShare1 string
param fileShare2 string
param fileShare3 string
param workspaceId string
@secure()
param workspaceKey string
param workspaceResourceId string


resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2022-09-01' = {  
  name: aciResourceName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    containers: [
      {
        name: aciResourceName
        properties: {
          image: '${containerRegistryName}.azurecr.io/${imageName}'
          ports: [
            {
              port: 80
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 2
            }
          }
	 environmentVariables: [
            {
              name: 'SECRET_ENV_VAR'
              value: secretEnvValue
            }
          ]
          volumeMounts: [
           {
              name: 'myshare1'
              mountPath: '/mnt/share1'
            }
            {
              name: 'myshare2'
              mountPath: '/mnt/share2'
            }
            {
              name: 'myshare3'
              mountPath: '/mnt/share3'
            }
          ]
        }
      }
    ]
    imageRegistryCredentials: [
      {
        server: '${containerRegistryName}.azurecr.io'
        username: containerRegistryName
        password: containerRegistryPassword
      }
    ]    
    osType: 'Linux'
    restartPolicy: 'Never'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          port: 80
        }
      ]
    }
    volumes: [     
      {
        name: 'myshare1'
        azureFile: {
          shareName: fileShare1
          storageAccountName: storageAccountName
          storageAccountKey: storageAccountKey
          readOnly: false
        }
      }
      {
        name: 'myshare2'
        azureFile: {
          shareName: fileShare2
          storageAccountName: storageAccountName
          storageAccountKey: storageAccountKey
          readOnly: false
        }
      }
      {
        name: 'myshare3'
        azureFile: {
          shareName: fileShare3
          storageAccountName: storageAccountName
          storageAccountKey: storageAccountKey
          readOnly: false
	      }
     }
   ]
   diagnostics: {
    logAnalytics: {
      logType: 'ContainerInstanceLogs'      
      workspaceId: workspaceId
      workspaceKey: workspaceKey
      workspaceResourceId: workspaceResourceId
    }
  }
 }
}
