class AddColumnToNews < ActiveRecord::Migration[5.1]
  def up
    add_column :news, :pic, :blob
    add_column :news, :introduce, :text
  end
  def down
    remove_column :pic
    remove_column :introduce
  end
end
