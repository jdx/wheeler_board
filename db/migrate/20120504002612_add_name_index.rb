class AddNameIndex < ActiveRecord::Migration
  def change
    add_index :profiles, :name
  end
end
