output "k8s_kubedev_kube_config" {
  value = digitalocean_kubernetes_cluster.k8s_cluster.endpoint
}