class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
