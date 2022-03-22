class AddAttrToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :local_address, :string
    add_column :students, :permanent_address, :string
    add_column :students, :permanent_contact_number, :integer
    add_column :students, :alternate_contact_number, :integer
  end
end
