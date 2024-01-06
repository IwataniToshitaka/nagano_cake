class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item #ここでorderとorder_detailを結び付けているためorder_detail.item.nameとかで呼び出せる
end