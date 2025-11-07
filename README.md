# 🧮 DevCalc API

A **DevCalc** é uma API REST simples desenvolvida em **Java**, criada com o objetivo de demonstrar a implementação de **pipelines automatizados (CI/CD)** utilizando **GitHub Actions**.  

Ela realiza operações matemáticas básicas e serve como base para validar processos de **build**, **testes automatizados**, **verificação de código**, **empacotamento** e **simulação de deploy**.

---

## 🚀 Tecnologias utilizadas

- **Java 21+**
- **Javalin Framework** (ou outro framework HTTP à sua escolha)
- **JUnit 5** para testes automatizados
- **Maven** ou **Gradle** para build e empacotamento
- **GitHub Actions** para CI/CD

---

## 🗂️ Estrutura do projeto

DevCalc/
├── src/
│ ├── main/
│ │ └── java/com/devcalc/
│ │ └── App.java
│ └── test/
│ └── java/com/devcalc/
│ └── AppTest.java
├── pom.xml (ou build.gradle)
├── README.md

---

## 📡 Endpoints da API

| Método | Endpoint | Exemplo de uso | Resultado |
|:------:|:----------|:----------------|:------------|
| GET | `/add?a=10&b=5` | `/add?a=10&b=5` | `15` |
| GET | `/subtract?a=10&b=5` | `/subtract?a=10&b=5` | `5` |
| GET | `/multiply?a=10&b=5` | `/multiply?a=10&b=5` | `50` |
| GET | `/divide?a=10&b=5` | `/divide?a=10&b=5` | `2` |

---

## ⚙️ Como executar o projeto

### 1️⃣ Clonar o repositório
```bash
git clone https://github.com/seuusuario/devcalc.git
cd devcalc

2️⃣ Executar o projeto

mvn clean package
java -jar target/devcalc.jar
