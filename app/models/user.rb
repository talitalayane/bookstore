class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :reservations
  has_many :books, through: :reservation

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :email],
    using: {
      tsearch: { prefix: true }
    }
end
