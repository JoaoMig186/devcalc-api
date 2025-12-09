# Configuração Kubernetes

Este diretório contém os manifestos YAML para deploy da aplicação no Kubernetes.

## Namespace

O namespace `tp2` foi criado para isolar os recursos deste trabalho prático.

### Aplicar o namespace:

```bash
kubectl apply -f namespace.yaml
```

### Verificar o namespace:

```bash
kubectl get namespace tp2
```

## Pod com Nginx e Busybox

O Pod `nginx-busybox-pod` contém dois containers:

1. **nginx**: Container com nginx versão 1.29.3-alpine-slim expondo a porta 80
2. **busybox**: Container que executa um script que a cada 10 segundos imprime a hora e faz uma requisição HTTP para o nginx

### Aplicar o Pod:

```bash
kubectl apply -f pod.yaml
```

### Verificar o Pod:

```bash
kubectl get pods -n tp2
```

### Ver logs do container busybox:

```bash
kubectl logs -n tp2 nginx-busybox-pod -c busybox
```

### Ver logs do container nginx:

```bash
kubectl logs -n tp2 nginx-busybox-pod -c nginx
```

### Verificar variáveis de ambiente do busybox:

```bash
kubectl exec -n tp2 nginx-busybox-pod -c busybox -- env | grep -E "USER|PASSWORD"
```

## Deployment da Aplicação

O Deployment `devcalc-api-deployment` gerencia as réplicas da aplicação Spring Boot.

### Características:

- **Réplicas iniciais**: 2
- **Liveness Probe**: Verifica se a aplicação está viva (após 30s, a cada 10s)
- **Readiness Probe**: Verifica se a aplicação está pronta para receber tráfego (após 10s, a cada 5s)
- **Porta**: 8080

### Aplicar o Deployment:

```bash
kubectl apply -f deployment.yaml
```

### Verificar o Deployment:

```bash
kubectl get deployment -n tp2
kubectl get pods -n tp2
```

### Ver detalhes do Deployment:

```bash
kubectl describe deployment devcalc-api-deployment -n tp2
```

### Escalar o Deployment imperativamente para 3 réplicas:

```bash
kubectl scale deployment devcalc-api-deployment --replicas=3 -n tp2
```

### Verificar o escalonamento:

```bash
kubectl get pods -n tp2
kubectl get deployment devcalc-api-deployment -n tp2
```

### Ver logs de um pod específico:

```bash
kubectl logs -n tp2 <nome-do-pod>
```

### Verificar os probes:

```bash
kubectl describe pod <nome-do-pod> -n tp2 | grep -A 10 "Liveness\|Readiness"
```

## Service ClusterIP para Nginx

O Service `nginx-service` expõe o pod nginx apenas dentro do cluster, redirecionando a porta 8081 para a porta 80 do container nginx.

### Características:

- **Tipo**: ClusterIP (apenas dentro do cluster)
- **Porta do Service**: 8081
- **Porta do Pod**: 80 (container nginx)
- **Selector**: `app: nginx-busybox`

### Aplicar o Service:

```bash
kubectl apply -f service-nginx.yaml
```

### Verificar o Service:

```bash
kubectl get svc -n tp2
kubectl describe svc nginx-service -n tp2
```

### Testar o Service com pod busybox:

```bash
# Aplicar o pod de teste
kubectl apply -f test-busybox-pod.yaml

# Verificar o pod
kubectl get pods -n tp2 | grep test-busybox

# Ver os logs (mostra o resultado da requisição)
kubectl logs -n tp2 test-busybox-pod

# Ou fazer requisição manual
kubectl exec -n tp2 test-busybox-pod -- wget -q -O- http://nginx-service:8081
```

### Explicação do redirecionamento:

- Requisições para `nginx-service:8081` são redirecionadas para `nginx-busybox-pod:80`
- O Service usa o selector `app: nginx-busybox` para encontrar o pod correto
- O DNS do Kubernetes resolve `nginx-service` para o IP do Service dentro do cluster

### Listar recursos no namespace:

```bash
kubectl get all -n tp2
```

