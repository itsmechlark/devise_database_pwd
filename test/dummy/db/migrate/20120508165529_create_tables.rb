class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps(null: false)
    end
  end

  def self.down
    drop_table :users
  end
end
