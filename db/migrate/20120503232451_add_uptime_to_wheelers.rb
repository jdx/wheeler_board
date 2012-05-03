class AddUptimeToWheelers < ActiveRecord::Migration
  def change
    change_table :wheelers do |t|
      t.integer :uptime
    end

    add_index :wheelers, :uptime
  end
end
