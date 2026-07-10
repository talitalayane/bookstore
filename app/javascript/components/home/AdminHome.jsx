import React from 'react'
import HomeCard from './HomeCard.jsx'

const AdminHome = ({ adminName }) => {
  const cards = [
    {
      title: 'Livros',
      description: 'Gerenciar acervo.',
      buttonText: 'Ir para Livros',
      buttonHref: '/books',
      buttonClass: 'btn btn-primary btn-sm'
    },
    {
      title: 'Usuários',
      description: 'Gerenciar usuários.',
      buttonText: 'Ir para Usuários',
      buttonHref: '/users',
      buttonClass: 'btn btn-primary btn-sm'
    },
    {
      title: 'Reservas',
      description: 'Gerenciar reservas.',
      buttonText: 'Ir para Reservas',
      buttonHref: '/reservations',
      buttonClass: 'btn btn-primary btn-sm'
    },
    {
      title: 'Admins',
      description: 'Gerenciar administradores.',
      buttonText: 'Ir para Admins',
      buttonHref: '/admins',
      buttonClass: 'btn btn-primary btn-sm'
    }
  ]

  return (
    <>
      <div className="row mt-5">
        <div className="col-md-8">
          <h2>Bem-vindo ao painel administrativo, {adminName}!</h2>
          <p className="lead">Aqui você pode gerenciar livros, usuários, administradores e reservas.</p>
        </div>
      </div>

      <div className="row mt-4">
        {cards.map((card) => (
          <HomeCard key={card.title} {...card} />
        ))}
      </div>
    </>
  )
}

export default AdminHome
