FROM python:3.13.5-alpine3.22
# Define a imagem base como Python 3.11 slim, que é uma versão mais leve do Debian Buster.

WORKDIR /app
# Define o diretório de trabalho dentro do container como /app.

COPY requirements.txt .
# Copia o arquivo requirements.txt para o diretório de trabalho.

RUN pip install --no-cache-dir -r requirements.txt
# Instala as dependências do projeto listadas no requirements.txt, sem usar cache para reduzir o tamanho da imagem.

COPY . .
# Copia todos os arquivos do diretório atual para o diretório de trabalho no container.

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# Define o comando padrão para executar a aplicação usando Uvicorn.
# "app:app" especifica o módulo e a instância do aplicativo FastAPI.
# "--host 0.0.0.0" permite que o servidor seja acessível externamente.
# "--port 8000" define a porta em que o servidor irá escutar.
