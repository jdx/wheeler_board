class RemoveDateFromWheelers < ActiveRecord::Migration
  def change
    remove_column :wheelers, :date
  end
end
