class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :nickname
      t.string :maintitle
      t.integer :user_id

      t.timestamps
    end
  end
end
