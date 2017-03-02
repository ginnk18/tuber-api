class ChangePhoneType < ActiveRecord::Migration[5.0]
  def up
    remove_column(:tutors, :phone, :integer)
    add_column(:tutors, :phone, :string)
  end

  def down
    remove_column(:tutors, :phone, :string)
    add_column(:tutors, :phone, :integer)
  end
end
