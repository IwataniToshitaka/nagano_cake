# app/controllers/public/customers_controller.rb
class Public::CustomersController < ApplicationController
  before_action :authenticate_customers!

  def show
  end
end