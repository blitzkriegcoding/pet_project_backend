class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|
      t.integer :id_temperature
      t.decimal :temperature
      t.integer :generated_at

      t.timestamps
    end
  end
end
