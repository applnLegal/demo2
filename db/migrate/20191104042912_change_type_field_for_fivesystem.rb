class ChangeTypeFieldForFivesystem < ActiveRecord::Migration[5.1]
  def up
    rename_column :fivesystems, :type, :content
  end
  def down
    rename_column :fivesystems, :content, :type
  end
end
