class CreateArticleitselves < ActiveRecord::Migration[5.1]
  def change
    create_table :articleitselves do |t|
      t.string :leadauthor
      t.string :title
      t.text :content
      t.time :time
      t.boolean :isopen
      t.string :channel
      t.string :reprintinterface

      t.timestamps
    end
  end
end
