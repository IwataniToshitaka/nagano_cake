class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  #商品の詳細画面表示
  def show
  end

  # 投稿データの保存
def create
  @item = Item.new(item_params)
  if  @item.save
    redirect_to admin_item_path(@item.id)
  else
    render :new
  end
end




  # 投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
