class ChangeAplContentFieldForNews < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :news, :content, :string
    end
    def down
      change_column :news, :content, :text
    end
  end
end
