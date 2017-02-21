class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :current_location

      t.timestamps
    end
  end
end
