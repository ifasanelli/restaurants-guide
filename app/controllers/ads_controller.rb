class AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurants, only: %i[new create]
  before_action :checkAdmin

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ads_params)
    if @ad.save
      flash[:notice] = 'Anúncio criado com sucesso!'
      redirect_to @ad
    else
      render :new
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path
  end

  private

  def ads_params
    params.require(:ad).permit(:name, :restaurant_id, :mini_ad)
  end

  def set_restaurants
    @restaurants = Restaurant.all
  end

  def admin?
    current_user.admin == true
  end

  def checkAdmin
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
end
