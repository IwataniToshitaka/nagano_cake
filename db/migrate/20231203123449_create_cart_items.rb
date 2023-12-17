class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :quentity, null: false
      t.references :item, foreign_key: true, null: false
      #`cart_items` テーブルの `item_id` カラムが `items` テーブルの `id` カラムを参照
      t.integer :customer_id, null: false
      #customer_idはcostomerのテーブル作成した後に追記要
      t.timestamps
    end
  end
end
