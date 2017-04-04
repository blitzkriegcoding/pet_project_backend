class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|      
      t.integer :location_id
      t.decimal :temperature
      t.decimal :pressure
      t.decimal :humidity
      t.decimal :temp_max
      t.decimal :temp_min
      t.string	:main
      t.text	:description
      t.string	:wind_speed	
      t.string	:icon
      t.integer :generated_at
      t.timestamps
      t.references :location, index: true, foreign_key: true
    end
  end
end
