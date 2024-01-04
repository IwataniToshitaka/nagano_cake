class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def show
    @order = Order.find(params[:id]) #オーダー情報を全て入れる
    @order_details = @order.order_details
    @payment_method = params[:order] ? params[:order][:payment_method] : nil
    @customer = @order.customer # オーダーした購入者の情報を取得する
  end

private

  def order_params
    params.require(:order).permit(:postal_code, :address, :delively_name, :payment_method)
  end
end
