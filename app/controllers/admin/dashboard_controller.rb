class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASSWORD"]
  def index
  end
  def edit
    render plain: "I'm only accessible if you know the password"
  end
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
