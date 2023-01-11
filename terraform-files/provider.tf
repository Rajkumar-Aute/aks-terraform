####################################################################
# terraform provider information
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.20.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

# azure credentials configuration
provider "azurerm" {
  features {}
}

provider "azuread" {

}

# terraform backend configuration
# storage account link
# https://portal.azure.com/#view/Microsoft_Azure_Storage/ContainerMenuBlade/~/overview/storageAccountId/%2Fsubscriptions%2Fa2bd2bf9-3b7e-457b-9828-0a81f1ffb88e%2FresourceGroups%2FGeneva-Osprey-team-tfstate%2Fproviders%2FMicrosoft.Storage%2FstorageAccounts%2Fgenevaosperyteamtfstate/path/tfstate/etag/%220x8DAC7C2A2516592%22/defaultEncryptionScope/%24account-encryption-key/denyEncryptionScopeOverride~/false/defaultId//publicAccessVal/Container
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateraj"
    storage_account_name = "tfstateraj"
    container_name       = "tfstateraj"
    key                  = "aks-test.tfstate"
  }
}

######################