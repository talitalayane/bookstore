import React from 'react'
import ReactDOM from 'react-dom'
import Navbar from '../components/shared/Navbar.jsx'

const mountAdminNavbar = () => {
  const node = document.getElementById('admin-navbar')

  if (node) {
    const userName = node.getAttribute('data-admin-name') || 'Administrador'
    const currentPath = node.getAttribute('data-current-path') || '/'
    const logoUrl = node.getAttribute('data-logo-url') || ''

    const navItems = [
      { label: 'Home', href: '/' },
      { label: 'Administradores', href: '/admins' },
      { label: 'Usuários', href: '/users' },
      { label: 'Livros', href: '/books' },
      { label: 'Reservas', href: '/reservations' }
    ]

    ReactDOM.render(
      <Navbar
        userName={userName}
        currentPath={currentPath}
        logoUrl={logoUrl}
        logoutPath="/sign_out"
        navItems={navItems}
        collapseId="navbarAdminNav"
      />,
      node
    )
  }
}

document.addEventListener('DOMContentLoaded', mountAdminNavbar)
document.addEventListener('turbolinks:load', mountAdminNavbar)