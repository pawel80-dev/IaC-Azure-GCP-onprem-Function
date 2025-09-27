# IaC-Azure-GCP-onprem-Function
Terraform, build and deploy Function type of service in Azure, GCP and on-prem infra.  
Each deployment is in a separate workflow (.yaml) file.  
Each workflow runs independent from each other.  
All jobs in the workflow start in pararel.  

Github runners:
- hosted for Azure and GCP deployments  
- self-hosted for on-prem deployment  

Authentication methods:
- Azure: OpenID Connect 
- GCP: service account key JSON  
- on-prem: TODO

Terraform state will be kept in Terraform Cloud (instead of Azure or GCP storage).  

Access to Azure is done via OpenID Connect (federated credentials in Entra ID application).  
https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-azure  
https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure-openid-connect  
https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp  
https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal  
AZURE_CLIENT_ID = Application ID