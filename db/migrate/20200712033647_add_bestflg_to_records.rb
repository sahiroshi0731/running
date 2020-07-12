class AddBestflgToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :bestflg, :boolean, default: false, null: false 
  end
end
