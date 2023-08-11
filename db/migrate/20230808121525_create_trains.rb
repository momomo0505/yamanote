class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :number
      t.string :organization
      t.string :text
      t.timestamps
    end
  end
end