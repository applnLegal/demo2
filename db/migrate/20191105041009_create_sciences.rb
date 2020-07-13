class CreateSciences < ActiveRecord::Migration[5.1]
  def change
    create_table :sciences do |t|
      t.string :title
      t.string :no
      t.text :content
      t.string :source
      t.string :author
      t.string :postdate

      t.timestamps
    end
  end
end
