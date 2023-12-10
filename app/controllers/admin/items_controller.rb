class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  #商品の詳細画面表示
  def show
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.save
    redirect_to admin_new_items_path
  end


  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:name, :image, :introduction, :price)
  end

end
