class CreateSubjectsTutorsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_tutors, id: false do |t|
      t.references :tutor, index: true
      t.references :subject, index: true
    end
  end
end
