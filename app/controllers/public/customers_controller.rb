# app/controllers/public/customers_controller.rb
class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer  # @customerに表示したいデータを格納する
  end

  def new
  end

  def edit
    #@customer = Customer.find(params[:id]) #退会機能用
  end

  def index
  @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page])
  end

  def top
  end

  def about
  end

end