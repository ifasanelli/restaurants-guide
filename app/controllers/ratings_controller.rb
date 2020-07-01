class RatingsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = @restaurant.ratings.create(params[:rating].permit(:star))
    @rating.user = current_user
    @rating.save
    flash[:notice] = 'Obrigado pelo seu voto!'
    redirect_to restaurant_path(@restaurant)
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = @restaurant.ratings.find(params[:id])
    flash[:notice] = 'Voto atualizado com sucesso!' if @rating.update(params[:rating].permit(:star))
    redirect_to restaurant_path(@restaurant)
  end
end
