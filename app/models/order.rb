class Order < ApplicationRecord

    enum payment_method: { credit_card: 0, transfer: 1 }


    has_many :ordered_items #中間テーブル
    has_many :items, through: :ordered_items #注文には商品が複数ある

 enum status: {
     "入金待ち":0,
     "入金確認":1,
     "製作中":2,
     "発送準備中":3,
     "発送済み":4,
 }

 enum payment_method: ["クレジットカード","銀行振込"]

end
