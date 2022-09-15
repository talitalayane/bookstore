class AddCollumnReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :status, :boolean, default: false
  end
end
