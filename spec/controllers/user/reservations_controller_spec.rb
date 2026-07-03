require 'rails_helper'

RSpec.describe User::ReservationsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user).and_return(true)
  end

  describe 'POST #create' do
    it 'creates the reservation for the signed in user and uses the selected book' do
      current_user = User.create!(name: 'Alice Silva', email: 'alice@example.com', password: '123456')
      other_user = User.create!(name: 'Bob Santos', email: 'bob@example.com', password: '123456')
      book = Book.create!(name: 'Dom Casmurro', author: 'Machado de Assis', category: 'Romance')
      book.update!(stock: 2)

      allow(controller).to receive(:current_user).and_return(current_user)

      post :create, params: {
        reservation: {
          book_id: book.id,
          user_id: other_user.id,
          status: true
        }
      }

      reservation = Reservation.last
      expect(reservation.user_id).to eq(current_user.id.to_s)
      expect(reservation.book_id).to eq(book.id.to_s)
      expect(book.reload.stock).to eq(1)
      expect(response).to redirect_to(user_reservations_path)
    end
  end

  describe 'POST #create when out of stock' do
    it 'does not create a reservation if book stock is zero' do
      current_user = User.create!(name: 'Alice Silva', email: 'alice2@example.com', password: '123456')
      book = Book.create!(name: 'Sem Estoque', author: 'Autor', category: 'X', stock: 0)

      allow(controller).to receive(:current_user).and_return(current_user)

      expect {
        post :create, params: { reservation: { book_id: book.id } }
      }.to_not change(Reservation, :count)

      expect(book.reload.stock).to eq(0)
    end
  end
end
