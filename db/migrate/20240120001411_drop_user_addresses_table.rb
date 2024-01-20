class DropUserAddressesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_addresses
  end
end
