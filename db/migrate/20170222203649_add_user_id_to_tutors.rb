class AddUserIdToTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :user_id, :string
    add_index :tutors, :user_id
  end
end
