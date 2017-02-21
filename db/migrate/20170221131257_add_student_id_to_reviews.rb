class AddStudentIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, :student_id
  end
end
