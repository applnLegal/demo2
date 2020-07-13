class AddColumnKeyIntoNews < ActiveRecord::Migration[5.1]
  def up
    add_column :news,:key,:string
  end
  def down
    remove_column :key
  end
end
