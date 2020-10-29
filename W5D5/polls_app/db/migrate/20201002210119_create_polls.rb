class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.text :title, null: false
      t.integer :author_id, null: false 
    end
    add_index :polls, :title
    add_index :polls, :author_id
  end
end
