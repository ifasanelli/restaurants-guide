class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[index new create]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @cuisines = Cuisine.all
    @restaurant = Restaurant.new
  end

  def edit
    @cuisines = Cuisine.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurante criado com sucesso!'
      redirect_to @restaurant
    else
      @cuisines = Cuisine.all
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      @cuisines = Cuisine.all
      render :edit
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :neighborhood, :city,
                                       :status, :phone, :phone2, :cost,
                                       :timmings, :happy_hour, :coffee,
                                       :delivery, :ac, :wifi, :cards,
                                       :tickets, :outside, :club, :vegetarian,
                                       :latitude, :longitude, :cuisine_id)
  end
end
