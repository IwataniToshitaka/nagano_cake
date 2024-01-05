class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8) #itemsに情報を入力してページネーション
    @total_items_count = Item.count #個数をカウントして表示
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
