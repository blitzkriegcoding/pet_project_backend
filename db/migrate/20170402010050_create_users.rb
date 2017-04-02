class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|      
      t.string :username
      t.string :email
      t.text :password
      t.text :token
      t.text :token
      t.timestamps
    end
  end
end
