resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = var.do_region
  version = var.cluster_version
  tags    = var.cluster_tags

  node_pool {
    name       = var.cluster_name
    size       = var.cluster_default_node_size
    node_count = var.cluster_default_node_count
    tags       = var.cluster_default_node_tags
  }
}

provider "kubernetes" {
  host = digitalocean_kubernetes_cluster.cluster.endpoint

  version = "~> 1.10"

  client_certificate     = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
}
