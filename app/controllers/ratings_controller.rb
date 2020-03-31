class RatingsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.ratings.create(params[:rating].permit(:star))
    flash[:alert] = 'Obrigado pelo seu voto!'
    redirect_to restaurant_path(@restaurant)
  end
end