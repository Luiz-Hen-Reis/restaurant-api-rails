class CreateUserAddressesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :user_addresses, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :street, null: false
      t.string :street_number, null: false
      t.string :zipcode, null: false
      t.string :complement, null: false
      t.string :district, null: false

      t.timestamps
    end
  end
end
