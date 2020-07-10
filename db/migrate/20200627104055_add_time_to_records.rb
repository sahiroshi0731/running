class AddTimeToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :hour, :integer, limit: 1
    add_column :records, :min, :integer, limit: 1
    add_column :records, :sec, :integer, limit: 1
  end
end
