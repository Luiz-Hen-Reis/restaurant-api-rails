class RenameSubtotalToTotalPriceInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :subtotal, :total_price
  end
end
