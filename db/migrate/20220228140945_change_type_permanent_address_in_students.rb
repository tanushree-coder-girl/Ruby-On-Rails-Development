class ChangeTypePermanentAddressInStudents < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :students, :permanent_address, :text
      end

      dir.down do
        change_column :students, :permanent_address, :string
      end
    end
  end
end
