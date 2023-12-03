class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :delively_name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :total_amount, null: false
      t.integer :payment_method, null: false

      #customer_idはcostomerのテーブル作成した後に追記要
      t.timestamps
    end
  end
end
