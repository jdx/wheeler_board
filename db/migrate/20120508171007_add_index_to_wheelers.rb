class AddIndexToWheelers < ActiveRecord::Migration
  def change
    add_index :wheelers, :created_at
  end
end
