class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end
  def show
        @categories = Category.all
        @product = Product.find(params[:id])
  end
end