class Book < ApplicationRecord
  has_many :reservation

  validates :name, :author, presence: true
end
