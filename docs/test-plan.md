# Caderno de Testes Manuais - Bookstore

## Como usar este caderno
Este arquivo serve como caderno de testes manuais para validar as mudanças do projeto. Cada caso descreve o cenário, os passos e o resultado esperado.

---

## 1. Autenticação

### 1.1 Login como usuário comum
- Página: `/users/sign_in`
- Passos:
  1. Acessar a tela de login do usuário.
  2. Informar email e senha.
  3. Submeter o formulário.
- Resultado esperado:
  - Usuário é redirecionado à home do usuário.
  - O nome do usuário aparece no header.

### 1.2 Login como admin
- Página: `/admins/sign_in`
- Passos:
  1. Acessar a tela de login de admin.
  2. Informar email e senha de admin.
  3. Submeter o formulário.
- Resultado esperado:
  - Admin é redirecionado ao painel admin.
  - O header mostra links do painel e o nome do admin.

---

## 2. Busca de livros

### 2.1 Buscar livro pelo nome como usuário
- Página: `/user/books`
- Passos:
  1. Abrir a página de livros do usuário.
  2. Digitar parte do título no campo de busca.
  3. Clicar em "Pesquisar".
- Resultado esperado:
  - A lista exibe apenas livros cujo nome/autor/categoria correspondem.

### 2.2 Buscar livro pelo nome como admin
- Página: `/admin/books`
- Passos:
  1. Abrir a página de livros do admin.
  2. Digitar parte do nome no campo de busca.
  3. Clicar em "Pesquisar".
- Resultado esperado:
  - A lista exibe livros correspondentes.

---

## 3. Busca de usuário (admin)

### 3.1 Buscar usuário pelo nome
- Página: `/admin/users`
- Passos:
  1. Abrir a página de usuários do admin.
  2. Digitar parte do nome no campo de busca.
  3. Clicar em "Pesquisar".
- Resultado esperado:
  - A lista exibe apenas usuários cujo nome/email correspondem.

---

## 4. Reserva de livros

### 4.1 Criar reserva como usuário autenticado
- Página: `/user/reservations/new`
- Passos:
  1. Acessar a tela de nova reserva.
  2. Verificar se o usuário autenticado já está definido por padrão.
  3. Escolher o livro a partir do ID ou, idealmente, de uma seleção mais clara.
  4. Enviar o formulário.
- Resultado esperado:
  - Reserva é criada para o usuário atual.
  - O nome do usuário aparece no registro da reserva.
  - O usuário não precisa digitar o próprio número de registro.

### 4.2 Impedir reserva quando o livro estiver sem estoque
- Página: `/user/reservations/new` ou na lista de livros.
- Passos:
  1. Tentar reservar um livro com estoque 0.
  2. Enviar o formulário.
- Resultado esperado:
  - A reserva não é criada.
  - Exibe mensagem de erro dizendo que o livro não está disponível.

### 4.3 Verificar devolução apenas pelo admin
- Página: `/user/reservations` e `/admin/reservations`
- Passos:
  1. Acessar a lista de reservas como usuário comum.
  2. Verificar se não há botão "Devolver Livro".
  3. Acessar a lista de reservas como admin.
  4. Verificar se o admin possui o botão para devolver.
- Resultado esperado:
  - Usuário comum não vê opção de devolver.
  - Admin vê e pode finalizar a reserva.

---

## 5. Navegação e header

### 5.1 Header padrão com logo
- Página: qualquer página do app.
- Passos:
  1. Verificar se o header aparece no topo.
  2. Confirmar presença do logo em `app/assets/images/logo.png`.
  3. Verificar links de navegação principais.
- Resultado esperado:
  - Header unificado e consistente para admin e usuário.

### 5.2 Botão para voltar a página principal
- Página: telas de cadastro/edição e reserva.
- Passos:
  1. Clicar no botão de voltar.
- Resultado esperado:
  - Retorna à página anterior ou ao principal de forma clara.

### 5.3 Link para painel admin na home
- Página: `/`
- Passos:
  1. Acessar a home do site.
  2. Verificar se existe botão ou link para o painel admin (quando logado como admin).
- Resultado esperado:
  - Admin encontra acesso rápido ao painel.

---

## 6. Observações de manutenção
- Este caderno deve ser atualizado sempre que uma nova página React for adicionada.
- Cada caso deve ter um campo de status manual: `Não testado`, `OK`, `Falha`.
