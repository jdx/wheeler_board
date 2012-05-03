class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :employee
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
