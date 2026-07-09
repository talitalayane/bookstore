import React from 'react'
import ReactDOM from 'react-dom'
import AdminHome from '../components/home/AdminHome.jsx'

const mountAdminHome = () => {
  const node = document.getElementById('admin-home')

  if (node) {
    const adminName = node.getAttribute('data-admin-name') || 'administrador'
    ReactDOM.render(<AdminHome adminName={adminName} />, node)
  }
}

document.addEventListener('DOMContentLoaded', mountAdminHome)
document.addEventListener('turbolinks:load', mountAdminHome)
