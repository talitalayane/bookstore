import React from 'react'

const UserHome = ({ userName }) => {
  return (
    <div className="row mt-5">
      <div className="col-md-8">
        <h2>Seja bem-vindo ao seu painel, {userName}!</h2>
        <p className="lead">Aqui você pode explorar nosso acervo de livros e fazer suas reservas.</p>
      </div>
    </div>
  )
}

export default UserHome
