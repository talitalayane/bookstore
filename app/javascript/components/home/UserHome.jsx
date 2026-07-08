import React from 'react'
import HomeCard from './HomeCard'

const UserHome = ({ userName }) => {
  const cards = [
    {
      title: 'Explorar Livros',
      description: 'Navegue por nossa coleção de livros e reserve os que lhe interessam.',
      buttonText: 'Ir para Livros',
      buttonHref: '/user/books'
    },
    {
      title: 'Minhas Reservas',
      description: 'Consulte o status de todas as suas reservas.',
      buttonText: 'Minhas Reservas',
      buttonHref: '/user/reservations'
    }
  ]

  return (
    <>
      <div className="row mt-5">
        <div className="col-md-8">
          <h2>Seja bem-vindo ao seu painel, {userName}!</h2>
          <p className="lead">Aqui você pode explorar nosso acervo de livros e fazer suas reservas!</p>
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

export default UserHome
