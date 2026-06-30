require 'rails_helper'

RSpec.describe 'admin/reservations/_form', type: :view do
  it 'renders user and book names as selectable options' do
    user = User.create!(name: 'Alice Silva', email: 'alice@example.com', password: '123456')
    book = Book.create!(name: 'Dom Casmurro', author: 'Machado de Assis', category: 'Romance')

    render partial: 'admin/reservations/form', locals: { reservation: Reservation.new }

    expect(rendered).to include(user.name)
    expect(rendered).to include(book.name)
  end
end
