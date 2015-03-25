class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token, null: false

      t.timestamps null: false
    end

    add_index :users, :token
  end
end
