class AddTutorIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, :tutor_id
  end
end
