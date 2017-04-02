class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|      
      t.decimal :temperature
      t.integer :location_id
      t.integer :generated_at
      t.timestamps
      add_reference :location, :temperature, foreign_key: true
    end
  end
end
