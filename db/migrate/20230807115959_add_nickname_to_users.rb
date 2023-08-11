class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
