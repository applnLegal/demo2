class ChangeFieldForNews < ActiveRecord::Migration[5.1]
  def up
    add_column :news, :source, :string
    add_column :news, :author, :string
    add_column :news, :postdate, :string
  end
  def down
    remove_column :source
    remove_column :author
    remove_column :postdate
  end
end
