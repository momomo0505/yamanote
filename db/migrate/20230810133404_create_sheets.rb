class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.timestamps
    end
  end
end