class CategoryController < ApplicationController
  def show
    @product_category = Product.where(category_id:params[:id])
  end
end