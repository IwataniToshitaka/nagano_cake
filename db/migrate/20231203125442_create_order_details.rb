class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :price, null: false
      t.integer :quentity, null: false
      t.references :order, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
