class CreatePassages < ActiveRecord::Migration[6.0]
  def change
    create_table :passages do |t|
      t.text :content
      t.string :book
      t.string :chapter
      t.string :verse
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
