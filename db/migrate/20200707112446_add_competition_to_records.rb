class AddCompetitionToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :competition, :string
  end
end
