class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!
    def new
    @order = Order.new
    #@orders = current_customer.orders.all
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
    end


end
