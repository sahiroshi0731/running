class AddUserIdToTargets < ActiveRecord::Migration[5.2]
  def change
    add_column :targets, :user_id, :integer
  end
  
end
