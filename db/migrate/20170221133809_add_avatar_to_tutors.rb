class AddAvatarToTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :avatar, :string
  end
end
