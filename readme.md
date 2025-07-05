# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## 🌐 Acesso Online

A API está disponível online no Google Cloud Run:
- **URL da API:** https://api-escola-1066972719875.southamerica-east1.run.app
- **Documentação interativa:** https://api-escola-1066972719875.southamerica-east1.run.app/docs

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)

## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/guilhermeonrails/imersao-devops/archive/refs/heads/main.zip)

2. **Crie um ambiente virtual:**
   ```sh
   python3 -m venv ./venv
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
   - No Windows, abra um terminal no modo administrador e execute o comando:
   ```sh
   Set-ExecutionPolicy RemoteSigned
   ```

     ```sh
     venv\Scripts\activate
     ```

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

---

## 🚀 Deploy no Google Cloud Run

### Autenticando no Google Cloud

```sh
gcloud auth login
gcloud config set project PROJECT_ID
```

### Fazendo o Deploy

```sh
gcloud run deploy api-escola --source . --region southamerica-east1 --allow-unauthenticated
```

### Acessando a API Deployada

Após o deploy, sua API estará disponível em:
- **URL da API:** https://api-escola-1066972719875.southamerica-east1.run.app
- **Documentação:** https://api-escola-1066972719875.southamerica-east1.run.app/docs

## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.
- `Dockerfile`: Configuração para containerização da aplicação.

## 📋 Endpoints Disponíveis

### Alunos
- `GET /alunos` - Lista todos os alunos
- `GET /alunos/{id}` - Busca aluno por ID
- `POST /alunos` - Cria novo aluno
- `PUT /alunos/{id}` - Atualiza aluno
- `DELETE /alunos/{id}` - Remove aluno
- `GET /alunos/nome/{nome}` - Busca alunos por nome
- `GET /alunos/email/{email}` - Busca aluno por email

### Cursos
- `GET /cursos` - Lista todos os cursos
- `GET /cursos/{id}` - Busca curso por ID
- `POST /cursos` - Cria novo curso
- `PUT /cursos/{id}` - Atualiza curso
- `DELETE /cursos/{id}` - Remove curso

### Matrículas
- `GET /matriculas` - Lista todas as matrículas
- `GET /matriculas/{id}` - Busca matrícula por ID
- `POST /matriculas` - Cria nova matrícula
- `PUT /matriculas/{id}` - Atualiza matrícula
- `DELETE /matriculas/{id}` - Remove matrícula

---

## 📝 Notas Importantes

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).
- A API está configurada para rodar tanto localmente quanto no Google Cloud Run.
- O deploy no Cloud Run é feito automaticamente usando Docker.

---
