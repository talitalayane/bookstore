import React from 'react'
import { createRoot } from 'react-dom/client'
import UserHome from '../components/home/UserHome.jsx'

const mountUserHome = () => {
  const node = document.getElementById('user-home')

  if (node) {
    const userName = node.getAttribute('data-user-name') || 'usuário'
    const root = createRoot(node)
    root.render(<UserHome userName={userName} />)
  }
}

document.addEventListener('DOMContentLoaded', mountUserHome)
document.addEventListener('turbolinks:load', mountUserHome)
