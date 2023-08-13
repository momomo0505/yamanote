class AddSeatNumberToSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :sheets, :seat_number, :integer
  end
end