class AddAttrToDemos < ActiveRecord::Migration[6.1]
  def up 
    add_column :demos, :testing, :string
  end
  def down 
    remove_column :demos, :testing
  end
end
