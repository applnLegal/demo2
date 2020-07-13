class AddIntrodeceFieldForScience < ActiveRecord::Migration[5.1]
  def up
    add_column :sciences, :introduce, :text
  end
  def down
    remove_column :introduce
  end
end
