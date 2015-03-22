class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :part_of_speech, null: false
      t.string :content, null: false

      t.timestamps null: false
    end

    add_index :words, :part_of_speech
    add_index :words, :content
  end
end
