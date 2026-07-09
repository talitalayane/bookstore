import React from 'react'
import ReactDOM from 'react-dom'
import UserHome from '../components/home/UserHome.jsx'

const mountUserHome = () => {
  const node = document.getElementById('user-home')

  if (node) {
    const userName = node.getAttribute('data-user-name') || 'usuário'
     ReactDOM.render(<UserHome userName={userName} />, node)
  }
}

document.addEventListener('DOMContentLoaded', mountUserHome)
document.addEventListener('turbolinks:load', mountUserHome)
