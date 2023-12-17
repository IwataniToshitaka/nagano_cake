class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id


  if @cart_item.save
    # カートアイテムの保存が成功した場合の処理
    redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  else
    # カートアイテムの保存が失敗した場合の処理
    redirect_to items_path, alert: 'カートに商品を追加できませんでした。'
  end
  end

def update
  @cart_items = current_customer.cart_items
  #@cart_item.quantity = params[:quantity]

  if @cart_items.save
    # カートアイテムの保存が成功した場合の処理
    redirect_to cart_item_path, notice: 'カート内の商品の個数を更新しました。'
  else
    # カートアイテムの保存が失敗した場合の処理
    redirect_to cart_item_path, alert: 'カート内の商品の個数を更新できませんでした。'
  end
end

  private

  def cart_items_params
    params.require(:cart_item).permit(:quentity, :item_id)
  end
end