import React from 'react'

const Navbar = ({
  userName,
  currentPath,
  logoUrl,
  logoutPath,
  navItems,
  collapseId = 'navbarNav'
}) => {
  const isActive = (href) => {
    if (href === '/') return currentPath === '/'
    return currentPath === href || currentPath.startsWith(`${href}/`)
  }

  return (
    <nav className="navbar navbar-expand-sm bg-light navbar-light">
      <div className="container">
        <div className="navbar-brand">
          <a href="/" className="navbar-brand">
            <img src={logoUrl} height="40" alt="Bookstore" />
          </a>
        </div>

        <button
          className="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target={`#${collapseId}`}
          aria-controls={collapseId}
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>

        <div className="collapse navbar-collapse" id={collapseId}>
          <ul className="navbar-nav ml-auto">
            {navItems.map((item) => (
              <li
                key={item.label}
                className={`nav-item ${isActive(item.href) ? 'active' : ''}`}
              >
                <a href={item.href} className="nav-link">
                  {item.label}
                </a>
              </li>
            ))}
          </ul>

          <ul className="navbar-nav">
            <li className="nav-item">
              <div className="py-2 mr-4" style={{ color: '#825DCD' }}>
                {userName}
              </div>
            </li>

            <li className="nav-item">
              <a
                href={logoutPath}
                data-method="delete"
                className="nav-link"
                style={{ color: '#825DCD' }}
              >
                Sair
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  )
}

export default Navbar