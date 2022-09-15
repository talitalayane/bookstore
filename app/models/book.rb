class Book < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservation

  validates :name, :author, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
