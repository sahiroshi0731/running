class AddEnrollmentToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :enrollment, :date, null: false
  end
end
