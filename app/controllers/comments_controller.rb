class CommentsController < ApplicationController
  def create
    # ajout if logged in apres
   Comment.create!(title:params[:name],content:params[:description],product_id:params[:product_id],user_id:current_user.id)
   redirect_to product_path(params[:product_id])
  end
end