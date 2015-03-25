class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :euphemism_id, null: false
      t.boolean :approve, default: false

      t.timestamps null: false
    end

    add_index :votes, :user_id
    add_index :votes, :euphemism_id
  end
end
