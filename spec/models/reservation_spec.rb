require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "reservation is valid" do
    user = User.create!(name: "Alice", email: "alice@example.com", password: "123456")
    book = Book.create!(name: "Dom Casmurro", author: "Machado de Assis", category: "Romance")
    reservation = Reservation.new(user_id: user.id.to_s, book_id: book.id.to_s, status: true)

    expect(reservation.user_id).to eql user.id.to_s
    expect(reservation.book_id).to eql book.id.to_s
    expect(reservation.status).to eql true
    expect(reservation).to be_valid
  end

  it "reservation is not valid" do
    reservation = Reservation.new(user_id: "", book_id: "1", status: true)

    expect(reservation).to_not be_valid
  end
end
