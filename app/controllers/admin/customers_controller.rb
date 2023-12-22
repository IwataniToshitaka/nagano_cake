class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    flash[:success] = '個人情報を編集しました'
    redirect_to admin_customer_path(@customer.id)
  else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
  end
  end



  #ストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :email, :address)
  end
end