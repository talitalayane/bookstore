import React from 'react'
import ReactDOM from 'react-dom'
import Navbar from '../components/shared/Navbar.jsx'

const mountUserNavbar = () => {
  const node = document.getElementById('user-navbar')

  if (node) {
    const userName = node.getAttribute('data-user-name') || 'Usuário'
    const currentPath = node.getAttribute('data-current-path') || '/'
    const logoUrl = node.getAttribute('data-logo-url') || ''

    const navItems = [
      { label: 'Home', href: '/' },
      { label: 'Livros', href: '/user/books' },
      { label: 'Minhas Reservas', href: '/user/reservations' }
    ]

    ReactDOM.render(
      <Navbar
        userName={userName}
        currentPath={currentPath}
        logoUrl={logoUrl}
        logoutPath="/users/sign_out"
        navItems={navItems}
        collapseId="navbarUserNav"
      />,
      node
    )
  }
}

document.addEventListener('DOMContentLoaded', mountUserNavbar)
document.addEventListener('turbolinks:load', mountUserNavbar)