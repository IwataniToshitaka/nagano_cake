class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details #orderdetailsモデルに入力した情報をorderコントローラでも使用するため
    @payment_method = params[:order] ? params[:order][:payment_method] : nil
    #@order_details = OrderDetail.find(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit( :postal_code, :address, :delivaly_name, :payment_method)
  end

end
