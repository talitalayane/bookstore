class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :book

  def status?;end
end
