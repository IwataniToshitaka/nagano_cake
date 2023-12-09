# app/controllers/public/customers_controller.rb
class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

def show
  @customer = current_customer  # @customerに表示したいデータを格納する
end

  def new
  end

  def edit
  end

  def index
  end


end
