class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.string :payment_method
      t.timestamps
    end
  end
end
