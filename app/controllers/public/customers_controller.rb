class Public::CustomersController < ApplicationController
  before_action :authenticate_customers!
end
