class AddPicFieldForScience < ActiveRecord::Migration[5.1]
  def up
    add_column :sciences, :pic, :blob
  end
  def down
    remove_column :pic
  end
end
