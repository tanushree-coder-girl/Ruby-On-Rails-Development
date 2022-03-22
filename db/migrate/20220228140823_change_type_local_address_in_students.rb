class ChangeTypeLocalAddressInStudents < ActiveRecord::Migration[6.1]
  def up
    change_column :students, :local_address, :text
  end

  def down 
    change_column :students, :local_address, :string
  end
end