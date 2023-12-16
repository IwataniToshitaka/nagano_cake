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
    @item = Item.new(item_params)
    if params[:item][:image].present?
      @item.image.attach(params[:item][:image])
    else
      @item.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'no_image.jpg')), filename: 'no_image.jpg', content_type: 'image/jpeg')
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  else
    render :edit
  end
  end



  # 投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :edit)
  end
end
