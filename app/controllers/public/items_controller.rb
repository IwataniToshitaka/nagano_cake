class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:id])
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  def update
  end

end
