class CreateTutors < ActiveRecord::Migration[5.0]
  def change
    create_table :tutors do |t|
      t.text :education
      t.text :experience
      t.string :email
      t.integer :phone
      t.string :hours
      t.integer :rate_cents
      t.string :current_location
      t.boolean :is_available
      t.string :subjects
      t.string :password_hash

      t.timestamps
    end
  end
end
