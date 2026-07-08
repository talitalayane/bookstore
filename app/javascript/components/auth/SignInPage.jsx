import React from 'react'

const SignInPage = ({
  scope,
  title,
  subtitle,
  submitLabel,
  submitPath,
  authToken,
  alertMessage,
  noticeMessage,
  switchHref,
  switchLabel,
  registerHref,
  registerLabel,
  logoUrl
}) => {
  const isAdmin = scope === 'admin'

  return (
    <div className="min-vh-100 d-flex align-items-center justify-content-center px-3 py-5" style={{ background: 'linear-gradient(135deg, rgba(130, 93, 205, 0.15), rgba(102, 213, 191, 0.2))' }}>
      <div className="row w-100 justify-content-center">
        <div className="col-12 col-md-8 col-lg-5">
          <div className="card border-0 shadow-lg rounded-4 overflow-hidden">
            <div className="card-body p-4 p-md-5">
              <div className="text-center mb-4">
                <div className="d-inline-flex align-items-center justify-content-center rounded-circle bg-light" style={{ width: 96, height: 96 }}>
                  {logoUrl ? (
                    <img src={logoUrl} alt="Logo" className="img-fluid" style={{ maxHeight: 64 }} />
                  ) : (
                    <span className="display-4">📚</span>
                  )}
                </div>
              </div>

              <div className="text-center mb-4">
                <h3 className="h4 mb-2">{title}</h3>
                <p className="text-muted mb-0">{subtitle}</p>
              </div>

              {(alertMessage || noticeMessage) && (
                <div className={`alert ${alertMessage ? 'alert-danger' : 'alert-info'} text-center py-2`} role="alert">
                  {alertMessage || noticeMessage}
                </div>
              )}

              <form method="post" action={submitPath}>
                <input type="hidden" name="authenticity_token" value={authToken} />

                <div className="form-group">
                  <label htmlFor={`${scope}_email`} className="form-label font-weight-bold">E-mail</label>
                  <input
                    id={`${scope}_email`}
                    name={`${scope}[email]`}
                    type="email"
                    autoComplete="email"
                    className="form-control form-control-lg"
                    placeholder="seu@email.com"
                    required
                  />
                </div>

                <div className="form-group">
                  <label htmlFor={`${scope}_password`} className="form-label font-weight-bold">Senha</label>
                  <input
                    id={`${scope}_password`}
                    name={`${scope}[password]`}
                    type="password"
                    autoComplete="current-password"
                    className="form-control form-control-lg"
                    placeholder="Digite sua senha"
                    required
                  />
                </div>

                <div className="form-group form-check">
                  <input id={`${scope}_remember_me`} name={`${scope}[remember_me]`} type="checkbox" className="form-check-input" />
                  <label htmlFor={`${scope}_remember_me`} className="form-check-label">Lembrar-me</label>
                </div>

                <div className="d-grid gap-2 mt-4">
                  <button type="submit" className="btn btn-primary btn-lg">{submitLabel}</button>
                </div>
              </form>

              <div className="mt-4 d-flex flex-column flex-sm-row justify-content-center gap-2">
                {isAdmin ? (
                  <a href={switchHref} className="btn btn-outline-secondary btn-sm">{switchLabel}</a>
                ) : (
                  <>
                    <a href={switchHref} className="btn btn-outline-secondary btn-sm">{switchLabel}</a>
                    {registerHref && (
                      <a href={registerHref} className="btn btn-link btn-sm">{registerLabel}</a>
                    )}
                  </>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default SignInPage
