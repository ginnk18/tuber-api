class FixSubjectsColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tutors, :subjects, :subjects_taught
  end
end
