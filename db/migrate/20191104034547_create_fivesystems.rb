class CreateFivesystems < ActiveRecord::Migration[5.1]
  def change
    create_table :fivesystems do |t|
      t.string :title
      t.content :type

      t.timestamps
    end
  end
end
