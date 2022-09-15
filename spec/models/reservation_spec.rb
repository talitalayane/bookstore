require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it "reservation is valid" do
    reservation = Reservation.new(user_id: "4", book_id: "5", status: true)

    expect(reservation.user_id).to eql "4"
    expect(reservation.book_id).to eql "5"
    expect(reservation.status).to eql true
    expect(reservation).to be_valid
  end

  it "reservation is not valid" do
    reservation = Reservation.new(user_id: "", book_id: "1", status: true)

    expect(reservation).to_not be_valid
  end
end
