#!/bin/bash

# Before running this script, specify correct values for the following 4 variables !!!!
AKS_RESOURCE_GROUP=rgTim_Danner
AKS_CLUSTER_NAME=akscluster
ACR_RESOURCE_GROUP=rgTim_Danner
ACR_NAME=tsdARCk8slab

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)

# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)

# Create role assignment
az role assignment create --assignee $CLIENT_ID --role acrpull --scope $ACR_ID

echo "CLIENT_ID_SP: $CLIENT_ID"
echo "ACR_ID: $ACR_ID"
