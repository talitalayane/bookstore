# Roadmap de Evolução do Projeto Bookstore

## Objetivo
Criar um plano de ação claro para melhorar a usabilidade atual, corrigir bugs existentes e iniciar a migração progressiva do front-end ERB para React, mantendo o monolito Rails.

## Fases do plano

### Fase 1 — Correções imediatas e UX
1. Corrigir busca de usuários no admin
   - `app/controllers/admin/users_controller.rb` deve usar `User.global_search`, não `Book.global_search`.
   - Atualizar o formulário de busca em `app/views/admin/users/_search.html.erb` para usar `admin_users_path`.

2. Ajustar formulário de reserva do usuário
   - O usuário autenticado deve ter o próprio `user_id` preenchido automaticamente.
   - Mostrar `name` ao invés do número de registro sempre que possível.
   - Remover do usuário comum a opção de devolver livro (somente admin pode devolver).

3. Adicionar navegação de volta e acesso ao painel
   - Criar botão de retorno em telas de cadastro/edição onde faz sentido.
   - Adicionar no header do projeto link para o painel admin (quando usuário admin estiver logado).
   - Garantir que a página principal tenha acesso ao painel admin de forma clara.

4. Criar header padrão com logo
   - Usar o logo existente em `app/assets/images/logo.png`.
   - Construir um header padrão para admin e user com links principais.

### Fase 2 — Regras de estoque e reserva
1. Incluir quantidade de livros em estoque
   - Adicionar campo `stock` em `Book` (migrar banco se necessário).
   - Exibir estoque na lista de livros e na edição/admin.

2. Implementar lógica de reserva por stock
   - Impedir criação de reserva quando `stock <= 0`.
   - Diminuir o estoque ao criar a reserva e, opcionalmente, aumentar ao devolver.
   - Mostrar mensagem clara quando o livro estiver sem disponibilidade.

3. Ajustar visualização de estado de reservas
   - Exibir status e data de devolução no painel de reservas.
   - Garantir que apenas admin possa finalizar/devolver.

### Fase 3 — Migrar front-end para React aos poucos
1. Instalar React com Webpacker
   - Executar `rails webpacker:install:react` de forma controlada.
   - Manter ERB ativo para todas as páginas até que cada migração seja feita.

2. Criar primeiros componentes React
   - Primeiro componente sugerido: `Header` global com logo.
   - Segundo componente sugerido: `BookSearch` ou `BookList` na página de livros.
   - Depois, migrar gradualmente a página de `user/home#index` ou a lista de reservas para React.

3. Evolução incremental
   - Paginar componente por componente.
   - Mostrar no projeto a transição: ERB + React coexistindo.
   - Priorizar páginas de maior impacto para entrevistas: home, busca de livros, reservas.

### Fase 4 — Testes e documentação
1. Escrever caderno de testes manuais
   - Testes de fluxo de usuário e admin.
   - Cenários de reserva, busca, criação e devolução.

2. Adicionar cobertura de testes automatizados
   - RSpec para modelos, controllers e requests.
   - Capybara para testes de sistema/fluxo.
   - Depois, Jest/React Testing Library para componentes React.

3. Atualizar README
   - Descrever o propósito do projeto.
   - Incluir versões de tecnologia e comandos de execução.
   - Referenciar os arquivos de documentação do projeto.

## Ordem recomendada de trabalho
1. Fase 1: correções e UX básico.
2. Fase 2: regras de estoque e validação de reserva.
3. Fase 3: React incremental.
4. Fase 4: testes e documentação final.

## Prioridades imediatas
- Corrigir busca do admin e do usuário por nome.
- Ajustar reserva do usuário autenticado.
- Remover a devolução de livro do usuário comum.
- Criar header padrão com logo.
