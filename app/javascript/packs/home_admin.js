import React from 'react'
import { createRoot } from 'react-dom/client'
import AdminHome from '../components/home/AdminHome.jsx'

const mountAdminHome = () => {
  const node = document.getElementById('admin-home')

  if (node) {
    const adminName = node.getAttribute('data-admin-name') || 'administrador'
    const root = createRoot(node)
    root.render(<AdminHome adminName={adminName} />)
  }
}

document.addEventListener('DOMContentLoaded', mountAdminHome)
document.addEventListener('turbolinks:load', mountAdminHome)
