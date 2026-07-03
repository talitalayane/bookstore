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

RSpec.describe Admin::ReservationsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_admin).and_return(true)
    allow(controller).to receive(:current_admin).and_return(Admin.new(id: 1, name: 'Admin'))
  end

  describe 'POST #create' do
    it 'does not allow admin to reserve a book with zero stock' do
      user = User.create!(name: 'Alice', email: 'alice@example.com', password: '123456')
      book = Book.create!(name: 'Sem Estoque', author: 'Autor', category: 'G', stock: 0)

      post :create, params: { reservation: { book_id: book.id, user_id: user.id } }

      expect(response.status).to eq(200)
      reservation = controller.instance_variable_get(:@reservation)
      expect(reservation.errors.full_messages).to include('Livro sem estoque disponível')
      expect(book.reload.stock).to eq(0)
      expect(Reservation.count).to eq(0)
    end

    it 'decrements stock when admin creates a reservation' do
      user = User.create!(name: 'Alice', email: 'alice@example.com', password: '123456')
      book = Book.create!(name: 'Com Estoque', author: 'Autor', category: 'G', stock: 2)

      post :create, params: { reservation: { book_id: book.id, user_id: user.id } }

      expect(response).to redirect_to(admin_reservations_path)
      expect(book.reload.stock).to eq(1)
      expect(Reservation.count).to eq(1)
    end
  end

  describe 'PATCH #update' do
    it 'updates only the selected reservation status to false' do
      user = User.create!(name: 'Alice', email: 'alice@example.com', password: '123456')
      book1 = Book.create!(name: 'Dom Casmurro', author: 'Machado de Assis', category: 'Romance')
      book2 = Book.create!(name: 'Quincas Borba', author: 'Machado de Assis', category: 'Romance')
      
      reservation1 = Reservation.create!(user_id: user.id.to_s, book_id: book1.id.to_s, status: true)
      reservation2 = Reservation.create!(user_id: user.id.to_s, book_id: book2.id.to_s, status: true)

      book1.update!(stock: 1)
      book2.update!(stock: 1)

      patch :update, params: {
        id: reservation1.id,
        reservation: { status: false }
      }

      reservation1.reload
      reservation2.reload
      
      expect(reservation1.status).to be false
      expect(reservation2.status).to be true
      expect(book1.reload.stock).to eq(2)
      expect(book2.reload.stock).to eq(1)
      expect(response).to redirect_to(admin_reservations_path)
    end
  end
end
