class Book < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservation

  validates :name, :author, presence: true
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
