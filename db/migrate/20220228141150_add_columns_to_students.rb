class AddColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :address, :string
    add_column :students, :dob, :datetime
    add_column :students, :age, :integer
  end
end