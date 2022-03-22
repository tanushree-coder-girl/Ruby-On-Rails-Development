class RenameDateOfDirthInStudents < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :date_of_dirth, :date_of_birth
  end
end
