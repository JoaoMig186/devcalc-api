# Script para build e push da imagem Docker para Docker Hub
# Uso: .\build-and-push.ps1 -DockerHubUsername "seu-usuario"
#      .\build-and-push.ps1 -DockerHubUser "seu-usuario"

param(
    [Parameter(Mandatory=$true)]
    [Alias("DockerHubUser")]
    [string]$DockerHubUsername
)

$IMAGE_NAME = "$DockerHubUsername/devcalc-api"

Write-Host "Building Docker image..." -ForegroundColor Green
docker build `
  -t "$IMAGE_NAME`:1.0.0" `
  -t "$IMAGE_NAME`:latest" ` .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Build successful!" -ForegroundColor Green
Write-Host ""
Write-Host "Pushing image with tag 1.0.0..." -ForegroundColor Green
docker push "$IMAGE_NAME`:1.0.0"


if ($LASTEXITCODE -ne 0) {
    Write-Host "Push failed for tag 1.0.0!" -ForegroundColor Red
    exit 1
}

Write-Host "Pushing image with tag latest..." -ForegroundColor Green
docker push "$IMAGE_NAME`:latest"


if ($LASTEXITCODE -ne 0) {
    Write-Host "Push failed for tag latest!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Success! Images pushed to Docker Hub:" -ForegroundColor Green
Write-Host "  - $IMAGE_NAME:1.0.0" -ForegroundColor Cyan
Write-Host "  - $IMAGE_NAME:latest" -ForegroundColor Cyan

