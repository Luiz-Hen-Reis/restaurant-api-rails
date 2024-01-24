class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.string :payment_method
      t.float :payment_cash_return
      t.float :delivery_price
      t.float :subtotal
      t.datetime :order_date

      t.timestamps
    end
  end
end
