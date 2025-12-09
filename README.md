![Maven CI](https://github.com/JoaoMig186/devcalc-api/actions/workflows/gradle-ci.yml/badge.svg)

# DevCalc API

API REST de calculadora desenvolvida em Spring Boot que oferece operações matemáticas básicas através de endpoints HTTP.

## 📋 Sobre o Projeto

A DevCalc API é uma aplicação web simples que fornece serviços de cálculo através de uma API REST. A aplicação implementa operações matemáticas básicas (soma, subtração, multiplicação e divisão) com tratamento de erros adequado.

## 🚀 Tecnologias Utilizadas

- **Java 21** - Linguagem de programação
- **Spring Boot 3.3.4** - Framework Java
- **Maven** - Gerenciador de dependências
- **JUnit 5** - Framework de testes
- **Docker** - Containerização
- **Eclipse Temurin** - JDK/JRE base para containers

## 📁 Estrutura do Projeto

```
devcalc-api/
├── src/
│   ├── main/
│   │   ├── java/com/devcalc/
│   │   │   ├── App.java                    # Classe principal da aplicação
│   │   │   ├── CalculatorController.java  # Controller REST
│   │   │   └── CalculatorService.java     # Lógica de negócio
│   │   └── resources/
│   └── test/
│       └── java/com/devcalc/
│           └── CalculatorServiceTest.java # Testes unitários
├── Dockerfile                              # Dockerfile padrão (sem multistage)
├── Dockerfile.multistage                   # Dockerfile com multistage build e testes
├── pom.xml                                 # Configuração Maven
├── build-and-push.ps1                      # Script para build e push ao Docker Hub
└── README.md                               # Este arquivo
```

## 🛠️ Pré-requisitos

- Java 21 ou superior
- Maven 3.6+ (ou use o Maven Wrapper)
- Docker (opcional, para containerização)

## 📦 Como Executar

### Executando Localmente

1. **Clone o repositório:**
   ```bash
   git clone <url-do-repositorio>
   cd devcalc-api
   ```

2. **Compile o projeto:**
   ```bash
   mvn clean package
   ```

3. **Execute a aplicação:**
   ```bash
   java -jar target/devcalc-api-1.0-SNAPSHOT.jar
   ```

   Ou usando Maven:
   ```bash
   mvn spring-boot:run
   ```

4. **Acesse a aplicação:**
   A API estará disponível em `http://localhost:8080`

### Executando com Docker

#### Usando Dockerfile padrão:
```bash
docker build -t devcalc-api:latest .
docker run -p 8080:8080 devcalc-api:latest
```

#### Usando Dockerfile multistage (com testes):
```bash
docker build -f Dockerfile.multistage -t devcalc-api:test .
docker run -p 8080:8080 devcalc-api:test
```

## 🧪 Executando Testes

```bash
mvn test
```

Os testes unitários cobrem todas as operações matemáticas, incluindo tratamento de divisão por zero.

## 📡 Endpoints da API

A API oferece os seguintes endpoints:

### Soma
```http
GET /add?a={numero1}&b={numero2}
```

**Exemplo:**
```bash
curl "http://localhost:8080/add?a=5&b=3"
# Resposta: 8.0
```

### Subtração
```http
GET /subtract?a={numero1}&b={numero2}
```

**Exemplo:**
```bash
curl "http://localhost:8080/subtract?a=5&b=3"
# Resposta: 2.0
```

### Multiplicação
```http
GET /multiply?a={numero1}&b={numero2}
```

**Exemplo:**
```bash
curl "http://localhost:8080/multiply?a=5&b=3"
# Resposta: 15.0
```

### Divisão
```http
GET /divide?a={numero1}&b={numero2}
```

**Exemplo:**
```bash
curl "http://localhost:8080/divide?a=6&b=3"
# Resposta: 2.0
```

**Erro (divisão por zero):**
```bash
curl "http://localhost:8080/divide?a=10&b=0"
# Resposta: 400 Bad Request - "Divisão por zero não é permitida"
```

## 🐳 Docker

### Build e Push para Docker Hub

Use o script PowerShell fornecido:

```powershell
.\build-and-push.ps1 -DockerHubUsername seu-usuario
```

Ou manualmente:

```bash
# Build com tags
docker build -t seu-usuario/devcalc-api:1.0.0 -t seu-usuario/devcalc-api:latest .

# Push
docker push seu-usuario/devcalc-api:1.0.0
docker push seu-usuario/devcalc-api:latest
```

### Dockerfile Multistage

O `Dockerfile.multistage` implementa um build em múltiplos estágios:

1. **Stage 1 (build-test)**: Compila o código e executa os testes unitários
2. **Stage 2 (build-package)**: Gera o JAR executável
3. **Stage 3 (final)**: Cria a imagem final otimizada com apenas o JAR

**Vantagens:**
- Garante que a imagem só é criada se todos os testes passarem
- Imagem final menor (usa apenas JRE)
- Separação clara entre build, testes e runtime

## 🧪 Testes Unitários

Os testes unitários estão localizados em `src/test/java/com/devcalc/CalculatorServiceTest.java` e cobrem:

- ✅ Soma de números
- ✅ Subtração de números
- ✅ Multiplicação de números
- ✅ Divisão de números
- ✅ Tratamento de divisão por zero

Execute os testes com:
```bash
mvn test
```

## 📝 Funcionalidades

- ✅ API REST com Spring Boot
- ✅ Operações matemáticas básicas (soma, subtração, multiplicação, divisão)
- ✅ Tratamento de erros (divisão por zero)
- ✅ Testes unitários completos
- ✅ Containerização com Docker
- ✅ Multistage build com execução de testes
- ✅ Script automatizado para build e push ao Docker Hub

## 🔧 Configuração

A aplicação roda na porta `8080` por padrão. Para alterar, configure a propriedade `server.port` no arquivo `application.properties` ou `application.yml`.

## 📄 Licença

Este projeto é um exemplo educacional.

## 👤 Autor

Desenvolvido como projeto de demonstração de boas práticas em desenvolvimento Java com Spring Boot e Docker.

---

**Versão:** 1.0-SNAPSHOT  
**Última atualização:** 2025

