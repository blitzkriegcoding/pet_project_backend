class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :id_location
      t.string :name_location
      t.integer :country_id
      t.timestamps
      add_reference :country, :location, foreign_key: true
    end
  end
end
