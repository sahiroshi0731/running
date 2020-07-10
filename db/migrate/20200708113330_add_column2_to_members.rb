class AddColumn2ToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :comment, :string
    add_column :members, :achievementymd, :date
    add_column :members, :bestfullhour, :integer, limit: 1
    add_column :members, :bestfullmin, :integer, limit: 1
    add_column :members, :bestfullsec, :integer, limit: 1
    add_column :members, :besthalfhour, :integer, limit: 1
    add_column :members, :besthalfmin, :integer, limit: 1
    add_column :members, :besthalfsec, :integer, limit: 1
  end
end
