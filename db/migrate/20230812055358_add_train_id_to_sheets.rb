class AddTrainIdToSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :sheets, :train_id, :integer
  end
end
