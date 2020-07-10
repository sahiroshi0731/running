class AddRaceflgToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :raceflg, :boolean, default: false, null: false  
  end
end
