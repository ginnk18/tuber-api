class CreateSubjectsTutorsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_tutors, id: false do |t|
      t.integer :tutor_id
      t.integer :subject_id
    end

    add_index :subjects_tutors, :tutor_id
    add_index :subjects_tutors, :subject_id
  end
end
