class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end
  def show
        @categories = Category.all
        @product = Product.find(params[:id])
  end
  def new
  end

  def create
    # ajout if logged in apres
   Product.create!(name:params[:name],description:params[:description],image:params[:image])
  end
end