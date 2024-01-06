class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @postage = 800 #送料は800円で固定
    @payment_method = params[:order][:payment_method]

    #以下、商品合計額の計算
    ary = []
    @cart_items.each do |cart_item|
    ary << cart_item.item.price*cart_item.quentity
  end
    @cart_items_price = ary.sum

    @total_amount = @postage + @cart_items_price
  end


  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.postal_code = params[:order][:postal_code]  # postal_codeの値を正しく取得するよう修正します

    @cart_items = CartItem.where(customer_id: current_customer.id)
      ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price * cart_item.quentity
  end
    @total_amount = ary.sum
    @order.total_amount = @order.postage + @total_amount
    @order.payment_method = params[:order][:payment_method]

  if @order.payment_method == "credit_card"
     @order.status = 1
  else
     @order.status = 0
  end

  if @order.save
    if @order.status == 0
      @cart_items.each do |cart_item|
        OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, quentity: cart_item.quentity,  status: 0)  # quentityをquantityに修正します
      end
    else
      @cart_items.each do |cart_item|
        OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, quentity: cart_item.quentity, status: 1)  # quentityをquantityに修正します
      end
    end

      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
    render :items
    end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page])
  end


  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page])
    @customer = current_customer
    @postage = 800
    @items = Item.all
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :address, :postal_code, :delively_name, :postage, :total_amount, :status)
  end
end