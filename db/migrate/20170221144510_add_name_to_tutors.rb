class AddNameToTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :name, :string
  end
end
