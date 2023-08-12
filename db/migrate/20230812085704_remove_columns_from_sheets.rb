class RemoveColumnsFromSheets < ActiveRecord::Migration[6.0]
  def change
    remove_column :sheets, :price, :decimal, precision: 10, scale: 2
    remove_column :sheets, :description, :string
  end
end