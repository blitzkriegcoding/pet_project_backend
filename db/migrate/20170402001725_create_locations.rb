class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :id_location
      t.string :name
      t.integer :id_country

      t.timestamps
    end
  end
end
