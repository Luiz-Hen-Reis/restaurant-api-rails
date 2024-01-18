class CreateUserAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street, null: false
      t.string :StreetNumber, null: false
      t.string :zipcode, null: false
      t.string :complement, null: false
      t.string :district, null: false

      t.timestamps
    end
  end
end
