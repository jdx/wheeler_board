class CreateWheelers < ActiveRecord::Migration
  def change
    create_table :wheelers do |t|
      t.references :profile, null: false
      t.references :lgtm_employee
      t.references :reporter, null: false
      t.string :description, null: false
      t.datetime :date, null: false

      t.timestamps
    end

    add_index :wheelers, :date
  end
end
