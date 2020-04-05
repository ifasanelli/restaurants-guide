class FullAdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurants, only: %i[new create]
  before_action :checkAdmin

  def index
    @full_ads = FullAd.all
  end

  def show
    @full_ad = FullAd.find(params[:id])
  end

  def new
    @full_ad = FullAd.new
  end

  def create
    @full_ad = FullAd.new(full_ads_params)
    if @full_ad.save
      flash[:notice] = 'Anúncio criado com sucesso!'
      redirect_to @full_ad
    else
      render :new
    end
  end

  def destroy
    @full_ad = FullAd.find(params[:id])
    @full_ad.destroy
    redirect_to full_ads_path
  end

  private

  def full_ads_params
    params.require(:full_ad).permit(:name, :restaurant_id, :fullpage_ad)
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