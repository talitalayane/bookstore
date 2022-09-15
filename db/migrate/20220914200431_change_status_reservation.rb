class ChangeStatusReservation < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :status, :string
  end
end
