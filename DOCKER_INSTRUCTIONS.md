# Instruções para Build e Push da Imagem Docker

## Pré-requisitos
1. Docker instalado e rodando
2. Conta no Docker Hub
3. Login no Docker Hub: `docker login`

## Build e Push

### Opção 1: Usando o script PowerShell
```powershell
.\build-and-push.ps1 -DockerHubUsername "seu-usuario-dockerhub"
```

### Opção 2: Comandos manuais

1. **Build da imagem com ambas as tags:**
```bash
docker build -t seu-usuario-dockerhub/devcalc-api:1.0.0 -t seu-usuario-dockerhub/devcalc-api:latest .
```

2. **Push da tag 1.0.0:**
```bash
docker push seu-usuario-dockerhub/devcalc-api:1.0.0
```

3. **Push da tag latest:**
```bash
docker push seu-usuario-dockerhub/devcalc-api:latest
```

## Verificação

Para verificar se as imagens foram criadas localmente:
```bash
docker images | grep devcalc-api
```

