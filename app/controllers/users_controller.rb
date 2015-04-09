class UsersController < ApplicationController
  def index
    @artist = User.where("artist = true")
  end
  def show
    @user = User.find(params[:id])
    @designed_products = Product.where(designer_id:params[:id])
  end
end