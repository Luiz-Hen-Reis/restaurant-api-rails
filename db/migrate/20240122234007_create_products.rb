class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.references :category, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
