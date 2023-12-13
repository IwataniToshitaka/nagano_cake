class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
    #@item.image.attach
  end

  # 商品の詳細画面表示
  def show
    @item = Item.find(params[:id])
  end

  # 投稿データの保存
  def create
    if params[:item][:image].present?
      @item = Item.new(item_params)
      @item.image.attach(params[:item][:image])
    else
      @item = Item.new(item_params)
      @item.image_comment = '画像がありません'
    end

    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  # 投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end