class ChangeNewsContent2 < ActiveRecord::Migration[5.1]
  def up  
   change_column :news, :content, :MEDIUMTEXT  
  end  
  
  def down  
   change_column :news, :content, :MEDIUMTEXT  
  end  
end
