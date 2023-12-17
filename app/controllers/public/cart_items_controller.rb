class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = Item.page(params[:page])
  end

  def create
    @cart_items = Item.page(params[:page])
    @cart_item = @item.cart_items.build # 新しいCartItemオブジェクトを作成し、関連付けを設定する
    # カートアイテムに必要な情報を設定する（例：数量など）
    @cart_item.quantity = params[:quantity]
    # その他の必要なカートアイテムの情報を設定する

  if @cart_item.save
    # カートアイテムの保存が成功した場合の処理
    redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  else
    # カートアイテムの保存が失敗した場合の処理
    redirect_to items_path, alert: 'カートに商品を追加できませんでした。'
  end
  end

def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.quantity = params[:quantity]

  if @cart_item.save
    # カートアイテムの保存が成功した場合の処理
    redirect_to cart_items_path, notice: 'カート内の商品の個数を更新しました。'
  else
    # カートアイテムの保存が失敗した場合の処理
    redirect_to cart_items_path, alert: 'カート内の商品の個数を更新できませんでした。'
  end
end
end