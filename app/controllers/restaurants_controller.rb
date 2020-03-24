class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[index new create edit update delete]
  before_action :restaurant_status, only: %i[edit update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @ads = Ad.all
  end

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
      flash[:notice] = 'Restaurante atualizado com sucesso!'
      redirect_to @restaurant
    else
      @cuisines = Cuisine.all
      render :edit
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    rp = params.require(:restaurant).permit(:name, :status, :address,
                                            :neighborhood, :city, :phone,
                                            :phone2, :cost, :timmings,
                                            :happy_hour, :coffee, :delivery,
                                            :ac, :wifi, :cards, :tickets,
                                            :outside, :club, :vegetarian,
                                            :map, :cuisine_id,
                                            pictures: [], menus: [])
    rp[:status] = params[:restaurant][:status].to_i
    rp
  end

  def restaurant_status
    @status = @restaurant.available? ? false : true
  end
end
