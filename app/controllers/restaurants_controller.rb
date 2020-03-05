class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show]
  def index
    @restaurants = Restaurant.all
  end

  def show; end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
