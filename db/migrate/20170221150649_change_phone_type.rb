class ChangePhoneType < ActiveRecord::Migration[5.0]
  def change
    change_column(:tutors, :phone, :string)
  end
end
