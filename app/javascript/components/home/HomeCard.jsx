import React from 'react'

const HomeCard = ({ title, description, buttonText, buttonHref, buttonClass = 'btn btn-primary' }) => {
  return (
    <div className="col-md-6 mb-4">
      <div className="card h-100">
        <div className="card-body">
          <h5 className="card-title">{title}</h5>
          <p className="card-text">{description}</p>
          <a href={buttonHref} className={buttonClass}>
            {buttonText}
          </a>
        </div>
      </div>
    </div>
  )
}

export default HomeCard
