class Book < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservation

  validates :name, :author, presence: true
end
