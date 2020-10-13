class CreateTopicPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_passages do |t|
      t.references :passage
      t.references :user
      t.references :topic

      t.timestamps
    end
  end
end
