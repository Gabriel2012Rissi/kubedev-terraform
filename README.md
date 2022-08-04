# Kubedev Terraform

### Usando Terraform com Docker

Para utilizar o [Terraform](https://github.com/hashicorp/terraform) com o [docker-compose](https://docs.docker.com/compose/install), siga os passos a seguir:

1. Inicialize o [Terraform](https://github.com/hashicorp/terraform) com o comando:

```
docker-compose run --rm terraform init
```

2. Para planejar a infraestrutura, utilize o comando:

```
docker-compose run --rm terraform plan
```

3. Para aplicar a infraestrutura, utilize o comando:

```
docker-compose run --rm terraform apply
```

4. Para adicionar o 'kube_config.yaml' gerado pelo Terraform e testar com o 'kubectl', use os comandos:

```
mv ~/.kube/config ~/.kube/config.backup
mv provisioning/files/kube_config.yaml ~/.kube/config
kubectl get nodes
```

5. Agora é a hora de testar o nosso cluster, para isso, use a sequência:

```
cd git
git clone https://github.com/Gabriel2012Rissi/conversao-temperatura-kubemanifest.git
cd conversao-temperatura-kubemanifest

# Aplicando os manifests
kubectl create namespace conversao-temperatura
kubectl apply -f ./deployment.yaml --namespace conversao-temperatura
kubectl get all --namespace conversao-temperatura
```

6. Para acessar a aplicação, basta criar um 'ip reservado'.

**Observação:** Não se esqueça de usar 'NodePort' do [Kubernetes](https://kubernetes.io/pt-br) nos services com um 'ip reservado', afinal, pode representar uma economia caso não seja necessário um 'load balance' atrelado... :wink:

7. Finalmente está na hora de destruir a nossa infraestrutura, para isso use o comando:

```
docker-compose run --rm terraform destroy
```

### Referências

FABRÍCIO VERONEZ DEV PRO. O que o mercado espera de você como especialista em DevOps + Terraform. YouTube, 03 de Ago. 2022. Disponível em: https://www.youtube.com/watch?v=K7wDMwJrv-k. Acesso em: 03 de Ago. 2022
