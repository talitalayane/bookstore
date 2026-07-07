import React from 'react'

const AdminHome = ({ adminName }) => {
  return (
    <div className="row mt-5">
      <div className="col-md-8">
        <h2>Bem-vindo ao painel administrativo, {adminName}!</h2>
        <p className="lead">Aqui você pode gerenciar livros, usuários, administradores e reservas.</p>
      </div>
      <div className="col-md-4 text-right">
        <a href="/" className="btn btn-secondary">← Voltar à Home</a>
      </div>
    </div>
  )
}

export default AdminHome
