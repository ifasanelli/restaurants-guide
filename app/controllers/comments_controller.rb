class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.create(params[:comment].permit(:body))
    flash[:alert] = 'Seu comentário será avaliado em breve'
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.find(params[:id])
    @comment.destroy
    redirect_to restaurant_path(@restaurant)
  end

  def approve_comment
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.find(params[:comment_id])
    @comment.update_attributes(status: :approved)
    redirect_to restaurant_path(@restaurant)
  end
end
