class AddColumnHasaddToArticleitself < ActiveRecord::Migration[5.1]
  def up
    add_column :articleitselves , :hasadd , :string
  end
  def down
    remove_column :hasadd
  end
end
