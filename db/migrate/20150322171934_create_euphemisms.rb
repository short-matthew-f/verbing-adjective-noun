class CreateEuphemisms < ActiveRecord::Migration
  def change
    create_table :euphemisms do |t|
      t.integer :verb_id, null: false
      t.integer :adjective_id, null: false
      t.integer :noun_id, null: false

      t.timestamps null: false
    end

    add_index :euphemisms, [:verb_id, :adjective_id, :noun_id], unique: true
  end
end
