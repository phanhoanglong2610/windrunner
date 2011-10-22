class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :membership
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end