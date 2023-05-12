# Azure CLI
az login
az account set --subscription 076688e2-d216-4def-80b8-240bf85d41b5
az group create --name bicepdemos2 --location "westeurope"
az deployment group create --name ExampleDeployment --resource-group bicepdemos2 --template-file .\Demo1StorageAndVNet.bicep --parameters prefix=bicepdemo2

#What If
az deployment group what-if --name ExampleDeployment --resource-group bicepdemos2 --template-file .\Demo1StorageAndVNet.bicep --parameters prefix=bicepdemo2
az group delete --name bicepdemos2
