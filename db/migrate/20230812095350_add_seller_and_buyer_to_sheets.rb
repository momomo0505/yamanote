class AddSellerAndBuyerToSheets < ActiveRecord::Migration[6.0]
  def change
    add_reference :sheets, :seller, foreign_key: { to_table: :users }
    add_reference :sheets, :buyer, foreign_key: { to_table: :users }
  end
end