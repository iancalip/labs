# ReLABS - Sistema de Gerenciamento de Exames

Este é um sistema de gerenciamento de exames desenvolvido em Ruby usando o framework Sinatra e Dockerizado para facilitar a implantação e o desenvolvimento.

## Pré-requisitos

- Docker
- Docker Compose

## Dependências

- Ruby 3.2.2
- Sinatra
- PostgreSQL
- Redis
- Sidekiq
- RSpec
- Puma
- CSV
- Byebug

## Configuração

Clone o repositório para sua máquina local:

bash

- git clone <https://github.com/iancalip/labs.git>


## Execução

Para iniciar a aplicação, execute o seguinte comando:

bash

- docker-compose up --build

Isso iniciará todos os serviços necessários (Redis, Sidekiq, PostgreSQL e a aplicação Sinatra) em contêineres Docker separados.

A aplicação Sinatra estará disponível em http://localhost:3000.

## Testes

Para executar os testes, você precisará entrar no contêiner da aplicação.

bash

- sudo docker-compose run web /bin/bash

Em seguida, entre no contêiner, use o seguinte comando:

bash

- redis-server --daemonize yes

- rspec

## Importação de CSV

Para importar um arquivo CSV, você pode fazer uma solicitação POST para /import com o conteúdo do arquivo CSV no corpo da solicitação.

Observação:
A "feature 4" continuará recebendo implementações ao longo dos próximos dias,
buscando atingir melhorias em seu algoritmo.

## API

A aplicação fornece as seguintes rotas da API:

    GET /tests: Retorna uma lista de todos os exames.
    GET /tests/:token: Retorna um exame específico com o token fornecido.
    POST /import: Importa um arquivo CSV.