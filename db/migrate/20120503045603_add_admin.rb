class AddAdmin < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.boolean :admin, null: false, default: false
    end
  end
end
