class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.integer :target_ym
      t.string :target_declaration
      t.decimal  :target_distance, precision: 6, scale: 3
      
      t.timestamps
    end
  end
end
