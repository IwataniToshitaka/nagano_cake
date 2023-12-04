class Public::OrdersController < ApplicationController
  before_action :authenticate_customers!
end
