class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

end
