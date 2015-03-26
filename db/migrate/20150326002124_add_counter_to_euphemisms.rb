class AddCounterToEuphemisms < ActiveRecord::Migration
  def change
    add_column :euphemisms, :like_count, :integer, default: 0
  end
end
