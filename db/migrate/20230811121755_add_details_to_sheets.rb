class AddDetailsToSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :sheets, :exit_station, :string
    add_column :sheets, :appearance, :text
  end
end
