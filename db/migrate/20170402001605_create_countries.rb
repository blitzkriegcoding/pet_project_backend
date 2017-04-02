class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|   	
      t.integer :id_country
      t.string :name
      t.string :initials
      t.timestamps
    end
  end
end
