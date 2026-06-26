# Bookstore

## Visão geral
Bookstore é um sistema monolítico em Ruby on Rails para gerenciamento de livros e reservas. O projeto atende dois perfis:

- Admin: cadastra livros e usuários, gerencia reservas e devoluções.
- Usuário comum: visualiza livros, pesquisa e cria reservas.

O objetivo atual é manter a aplicação Rails funcionando em ERB, corrigir bugs existentes e iniciar a migração progressiva do front-end para React.

## Tecnologias principais
- Ruby 3.1.0
- Rails 6.1.7
- PostgreSQL
- Webpacker 5
- React (integração incremental planejada)
- Devise para autenticação
- RSpec para testes
- PgSearch para busca full-text

## Status atual
- Backend: monolito Rails 6.1 com autenticação de `User` e `Admin`.
- Front-end: views ERB tradicionais, com Webpacker para assets JavaScript.
- Busca: `Book.global_search` já existe para livros; busca de usuários precisa correção.
- Testes: RSpec instalado; documentação de testes será adicionada em `docs/test-plan.md`.
- Migração para React será feita aos poucos, começando por componentes menores como header e busca.

## Como rodar o projeto
1. Instale dependências Ruby e Node:
   ```bash
   bundle install
   yarn install
   ```
2. Configure o banco de dados:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```
3. Inicie o servidor Rails:
   ```bash
   rails server
   ```
4. Em outro terminal, se necessário, inicie o Webpacker:
   ```bash
   ./bin/webpack-dev-server
   ```

## Comandos de teste
- Executar specs RSpec:
  ```bash
  bundle exec rspec
  ```

- Verificar links de documentação:
  - `docs/roadmap.md` — plano de evolução e cronograma
  - `docs/test-plan.md` — caderno de testes manuais

## Usuários de teste
- Usuário comum:
  - email: `Talita@user.com`
  - password: `123456`

- Admin:
  - email: `admin@bookstore.com`
  - password: `123456`

