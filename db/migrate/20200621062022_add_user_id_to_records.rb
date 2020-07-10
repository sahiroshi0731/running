class AddUserIdToRecords < ActiveRecord::Migration[5.2]
  def up
    add_reference :records, :user, null: false, index: true
  end
  
  def down
    remove_reference :records, :user, index: true
  end  
end
