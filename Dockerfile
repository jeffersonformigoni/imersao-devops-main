# Use uma imagem oficial do Python como imagem base.
FROM python:3.10-slim

# Define variáveis de ambiente para boas práticas em contêineres Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que a aplicação será executada
EXPOSE 8000

# Comando para executar a aplicação com Uvicorn.
# O host '0.0.0.0' é necessário para que a aplicação seja acessível de fora do contêiner.
# Usa a variável de ambiente PORT que o Cloud Run fornece, com fallback para 8000
CMD exec uvicorn app:app --host 0.0.0.0 --port $PORT