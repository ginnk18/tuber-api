class AddUserIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :user_id, :string
    add_index :students, :user_id
  end
end
