class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.date :run_day
      t.string :run_title
      t.text :run_article
      t.decimal  :run_distance, precision: 6, scale: 3
      t.time :run_time

      t.timestamps
    end
  end
end
