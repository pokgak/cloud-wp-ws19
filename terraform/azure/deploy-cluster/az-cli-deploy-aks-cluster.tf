provider "azurerm" {
    version     = "=1.34.0"
}

resource "azurerm_resource_group" "k8s" {
    name        = "${var.resource_group_name}"
    location    = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${var.cluster_name}"
    resource_group_name = "${azurerm_resource_group.k8s.name}"
    location            = "${azurerm_resource_group.k8s.location}"
    dns_prefix          = "${var.dns_prefix}"
    kubernetes_version  = "${var.k8s_version}"

    agent_pool_profile {
        name            = "default"
        count           = "${var.agent_count}"
        vm_size         = "Standard_D1_v2"
        os_type         = "Linux"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }

    tags {
        Environment = "Development"
    }
}
