class Book < ApplicationRecord
  CATEGORIES = ['Romance', 'Ficção científica', 'Policial / Suspense', 'Terror', 'Autoajuda', 'História / Política', 'Biografia / Memórias', 'Poesia', 'Educacional'].freeze

  has_many :reservations
  has_many :users, through: :reservation

  validates :name, :author, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES, message: 'deve ser uma categoria válida' }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
