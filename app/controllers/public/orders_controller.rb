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
   #if @order.save
      # 注文が保存された場合の処理
    #  redirect_to order_confirm_path
  #  else
      # 注文が保存されなかった場合の処理
  #    render :new
  #  end
  end

  def confirm
    @order = Order.new(order_params)
  if order_params[:address_option] == "own_address"
    # 「自身の住所」を選択した場合の処理
    @order.address = current_customer.address
    # 他の必要な属性の値を設定する

  elsif order_params[:address_option] == "registered_address"
    # 「登録済み住所から選択」を選択した場合の処理
    selected_address_id = order_params[:registered_address_id]
    selected_address = Address.find_by(id: selected_address_id, customer_id: current_customer.id)
 
    if selected_address
      @order.address = selected_address.address
      # 他の必要な属性の値を設定する
    else
      # 選択された住所が見つからなかった場合のエラー処理
      flash[:error] = "選択された住所が見つかりません"
      render :new
      return
    end

  elsif order_params[:address_option] == "new_address"
    # 「新しいお届け先」を選択した場合の処理
    @order.address = order_params[:new_address]
    # 他の必要な属性の値を設定する

  else
    # 上記以外の選択肢が送信された場合のエラー処理
    flash[:error] = "無効な住所オプションが選択されました"
    render :new
    return
  end

  if @order.save
    # 注文が保存された場合の処理
    redirect_to order_confirm_path
  else
    # 注文が保存されなかった場合の処理
    render :new
  end
  end

  private

  def order_params
    params.require(:order).permit(:payment, :address_id, :postal_code, :address, :delively_name, :postage)
  end
end