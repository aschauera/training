# command format
az group create --name "AzureTraining02" --location "westeurope"
#List images
az vm image list
#Create windows server 2019 vm
az vm create --resource-group "AzureTraining02" --name "AZvm" --image "Win2019Datacenter" --public-ip-sku "Standard" --admin-username "azureuser"
#export
az group export --name "AzureTraining02" > exportedtemplate.json

#tags
# usage example
az group update --name "AzureTraining02" --set tags.Env=Stage tags.Dept=IT

#Remove group
az group delete --name "AzureTraining02"

#Formatieren az Ausgabe
az group list --query "[].{RG Name:name}" -ojson 
az group list --query "[?name == 'Qna']" -otable

#Default location for az
az configure --defaults location=westeurope
az configure --defaults group=azTraining