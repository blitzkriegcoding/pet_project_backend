class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name_country
      t.string :initials
      t.timestamps      
    end
  end
end
