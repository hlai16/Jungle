class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"].to_s, password: ENV["ADMIN_PASSWORD"].to_s
  def index
  end
  def edit
    render plain: "I'm only accessible if you know the password"
  end
  def show
  end
end
