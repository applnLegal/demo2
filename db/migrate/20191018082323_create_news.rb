class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.integer :no
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
