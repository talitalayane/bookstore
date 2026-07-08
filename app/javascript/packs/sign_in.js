import React from 'react'
import { createRoot } from 'react-dom/client'
import SignInPage from '../components/auth/SignInPage.jsx'

const mountSignInPage = () => {
  const node = document.getElementById('sign-in-page')

  if (!node) return

  const scope = node.getAttribute('data-auth-scope') || 'user'
  const submitPath = node.getAttribute('data-submit-path') || '/users/sign_in'
  const authToken = node.getAttribute('data-auth-token') || ''
  const alertMessage = node.getAttribute('data-alert') || ''
  const noticeMessage = node.getAttribute('data-notice') || ''
  const switchHref = node.getAttribute('data-switch-href') || '/admins/sign_in'
  const switchLabel = node.getAttribute('data-switch-label') || 'Acessar Painel Admin'
  const registerHref = node.getAttribute('data-register-href') || ''
  const registerLabel = node.getAttribute('data-register-label') || 'Criar conta'

  const logoUrl = node.getAttribute('data-logo-url') || ''

  const props = {
    scope,
    title: scope === 'admin' ? 'Painel Administrativo' : 'Acesse sua conta',
    subtitle: scope === 'admin'
      ? 'Entre para gerenciar livros, usuários e reservas.'
      : 'Entre para aproveitar os benefícios da nossa biblioteca.',
    submitLabel: scope === 'admin' ? 'Entrar' : 'Entrar',
    submitPath,
    authToken,
    alertMessage,
    noticeMessage,
    switchHref,
    switchLabel,
    registerHref,
    registerLabel,
    logoUrl
  }

  const root = createRoot(node)
  root.render(<SignInPage {...props} />)
}

document.addEventListener('DOMContentLoaded', mountSignInPage)
document.addEventListener('turbolinks:load', mountSignInPage)
