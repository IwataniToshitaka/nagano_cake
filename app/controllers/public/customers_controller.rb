# app/controllers/public/customers_controller.rb
class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer  # @customerに表示したいデータを格納する
  end

  def new
  end

  def edit
    @customer = current_customer #退会機能用
  end

  def index
  @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page])
  end

  def top
  end

  def about
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    flash[:success] = '個人情報を編集しました'
    redirect_to customer_path(@customer.id)
    else
    flash[:danger] = '個人情報の編集に失敗しました'
    render :edit
    end
  end


  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to customer_my_page_path
  end

  #ストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :email, :address)
  end
end