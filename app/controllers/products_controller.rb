class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ]

  def index
    @products = Product.all
    @categories = Category.all
  end
  def show
    @categories = Category.all
    @product = Product.find(params[:id])
    @designer = User.find(@product.designer_id)
    @comments = Comment.where(product_id:params[:id])
    @retailprice = @product.product_details.all.order("retail_price ASC").first
  end
  def new
    @product = Product.new
  end
  def create
    # ajout if logged in apres
    @product = Product.new(name:params[:name],description:params[:description],image:params[:image],designer_id:current_user.id)
    if @product.save
      redirect_to action: "edit", id: @product.id
    else
      render 'new'
    end
    # @product = Product.create!(name:params[:name],description:params[:description],image:params[:image],designer_id:current_user.id)
     if current_user.artist == false
       user = User.find(current_user.id)
       user.update_attribute(:artist, true)
     end
  end
  def edit
    @product = Product.find(params[:id])
    if current_user.id == @product.designer_id
      @attributs = ProductDetail.where(product_id:@product.id)
    end
  end
  def update
    @product = Product.find(params[:id])
    if current_user.id == @product.designer_id
      @attributs = ProductDetail.where(product_id:@product.id)
      @product.update_attributes(name:params[:name],description:params[:description])
      @attributs.each do |attribut|
        unless params[attribut.id.to_s] == nil
         attribut.update_attributes(designer_markup:params[attribut.id.to_s])
        end
      end
      redirect_to action: "show", id: @product.id
    end
  end
  def manage
    @products = Product.where(designer_id:current_user.id)
  end
  def comission
    @payed_order = Order.all.select{|x| x.payment.allowed == true}.each{|order| order.order_details.select{|order|  order.product.designer_id == current_user.id }}
    @sold_products = []
    @payed_order.each do |order|
      order.order_details.each do |line_item|
        @sold_products << line_item.product_detail
      end
    end
  end
  def destroy
    if current_user
      @product = Product.find(params[:id])
      @product.destroy
    end
  end
end