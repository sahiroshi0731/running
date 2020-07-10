class AddColumn1ToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :sex, :string
    add_column :members, :age, :integer, limit: 1
    add_column :members, :fullhour, :integer, limit: 1
    add_column :members, :fullmin, :integer, limit: 1
    add_column :members, :fullsec, :integer, limit: 1
    add_column :members, :halfhour, :integer, limit: 1
    add_column :members, :halfmin, :integer, limit: 1
    add_column :members, :halfsec, :integer, limit: 1
  end
end
