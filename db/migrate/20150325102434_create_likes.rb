class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :euphemism_id, null: false

      t.timestamps null: false
    end

    add_index :likes, :user_id
    add_index :likes, :euphemism_id
  end
end
