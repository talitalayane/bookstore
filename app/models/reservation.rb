class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
