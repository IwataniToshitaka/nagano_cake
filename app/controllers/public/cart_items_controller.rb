class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
     @cart_items = current_customer.cart_items
  end


  def create
  @cart_item = current_customer.cart_items.find_by(item_id: cart_items_params[:item_id])

  if @cart_item
    # 既にカートに存在する場合、数量を更新する
    @cart_item.quentity += cart_items_params[:quentity].to_i
  else
    # カートに存在しない場合、新たに作成する
    @cart_item = current_customer.cart_items.new(cart_items_params)
  end

  if @cart_item.save
    redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  else
    redirect_to items_path, alert: 'カートに商品を追加できませんでした。'
  end
  end

  def update
     @cart_item = CartItem.find(params[:id]) # 編集したいカートアイテムの特定
     @cart_item.quentity = params[:cart_item][:quentity] # 編集したい数量を代入

    if @cart_item.save
     redirect_to cart_items_path, notice: 'カート内の商品の個数を更新しました。'
    else
     redirect_to cart_items_path, alert: 'カート内の商品の個数を更新できませんでした。'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id]) #カートアイテムという変数にカートアイテムモデルのパラメータからidを取り出して保管

    if @cart_item.destroy
      redirect_to cart_items_path, notice: 'カート内用品を削除しました'
    else
      redirect_to cart_items_path, alert: 'カート内の商品を削除できませんでした'
    end
  end


  def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path, notice: '全てのカートアイテムを削除しました'
  end



  private

  def cart_items_params
    params.require(:cart_item).permit(:quentity, :item_id)
  end
end