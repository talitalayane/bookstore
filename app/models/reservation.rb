class Reservation < ApplicationRecord

  belongos_to :user
  belongos_to :book

  def status?;end
end
