class AddPayPayAccountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :paypay_account, :string
  end
end
