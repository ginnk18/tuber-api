class AddTutorIdToTutorSubject < ActiveRecord::Migration[5.0]
  def change
    add_index :tutor_subjects, :tutor_id
  end
end
