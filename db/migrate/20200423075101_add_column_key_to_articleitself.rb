class AddColumnKeyToArticleitself < ActiveRecord::Migration[5.1]
  def up
    add_column :articleitselves , :key , :string
    change_column :articleitselves, :time, :datetime
  end
  def down
    remove_column :key
  end
end
