class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :order_products, id: :uuid do |t|
      t.references :order, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.references :product, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.float :product_price
      t.integer :quantity

      t.timestamps
    end
  end
end
