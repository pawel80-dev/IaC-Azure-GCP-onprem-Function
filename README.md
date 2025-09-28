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
- GCP: service account key JSON (review)  
- on-prem (TODO)  

Terraform state will be kept in Terraform Cloud (instead of Azure or GCP storage).  

Access to Azure is done via OpenID Connect (federated credentials in Entra ID application, Entity type = Environment, AZURE_CLIENT_ID = Application ID). Useful links:  
[GitHub OIDC in Azure](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-azure)  
[Microsoft Azure OIDC](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure-openid-connect)  
[Register a Microsoft Entra app](https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal#register-an-application-with-microsoft-entra-id-and-create-a-service-principal)  
[Microsoft Configure a federated identity credential on an app](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp)    
