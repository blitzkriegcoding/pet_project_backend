class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|      
      t.string :name_location
      t.integer :country_id
      t.timestamps
      t.references :countries, index: true, foreign_key: true
    end
  end
end
