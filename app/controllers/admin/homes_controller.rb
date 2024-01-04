class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

def top
  @orders = Order.page(params[:page])
  @orders.each do |order|
    total_quentity = order.order_details.sum(:quentity)
    order.instance_variable_set(:@total_quentity, total_quentity)
  end
end

end
