# Use uma imagem oficial do Python como imagem base.
# A tag 'slim' é uma boa escolha por ser leve. Versão alinhada com o README.
FROM python:3.10-slim

# Define variáveis de ambiente para boas práticas em contêineres Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
# Isso aproveita o cache de camadas do Docker. A instalação das dependências
# só será executada novamente se o arquivo requirements.txt mudar.
COPY requirements.txt .

# Instala as dependências do projeto
# O uso de --no-cache-dir reduz o tamanho da imagem
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Cria um usuário e grupo não-root para executar a aplicação (melhor prática de segurança)
RUN groupadd -r appgroup && useradd --no-log-init -r -g appgroup appuser

# Muda para o usuário não-root
USER appuser

# Expõe a porta em que a aplicação será executada
EXPOSE 8000

# Comando para executar a aplicação com Uvicorn.
# O host '0.0.0.0' é necessário para que a aplicação seja acessível de fora do contêiner.
# A flag --reload foi removida, pois não é recomendada para produção.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000",  "--reload"]