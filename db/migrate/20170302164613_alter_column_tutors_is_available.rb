class AlterColumnTutorsIsAvailable < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutors, :is_available, :boolean
    add_column :tutors, :status_code, :integer
  end
end
