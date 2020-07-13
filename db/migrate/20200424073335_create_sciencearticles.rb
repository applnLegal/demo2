class CreateSciencearticles < ActiveRecord::Migration[5.1]
  def change
    create_table :sciencearticles do |t|
      t.string :leadauthor
      t.string :title
      t.text :content
      t.time :datetime
      t.boolean :isopen
      t.string :channel
      t.string :reprintinterface
      t.string :key
      t.string :hasadd

      t.timestamps
    end
  end

end
