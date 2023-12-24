class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    # 注文情報の受け取りと処理の実装
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save
      # 注文が保存された場合の処理
      redirect_to order_confirm_path
    else
      # 注文が保存されなかった場合の処理
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    if @order.save
      # 注文が保存された場合の処理
      redirect_to order_confirm_path
    else
      # 注文が保存されなかった場合の処理
      render :new
    # 確認画面の表示などの処理
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment, :address_id, :postal_code, :address, :delively_name)
  end
end