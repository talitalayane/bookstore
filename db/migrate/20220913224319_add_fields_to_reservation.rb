class AddFieldsToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :user_id, :string
    add_column :reservations, :book_id, :string
  end
end
