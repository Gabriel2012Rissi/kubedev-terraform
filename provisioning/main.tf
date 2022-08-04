terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name   = var.k8s_cluster_name
  region = var.k8s_cluster_region
  # Pegue a última versão do slug recomendado no site da DigitalOcean
  # ou use o comando `doctl kubernetes options versions`
  version = var.k8s_cluster_version
  node_pool {
    name       = "node-pool-default"
    size       = var.k8s_cluster_node_size
    node_count = var.k8s_cluster_node_count
  }
}

resource "local_file" "kube_config" {
  content = digitalocean_kubernetes_cluster.k8s_cluster.kube_config.0.raw_config
  filename = "./files/kube_config.yaml"
}