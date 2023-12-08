# app/controllers/public/customers_controller.rb
class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def new
  end

  def edit
  end

end