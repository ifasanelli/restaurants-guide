class HomeController < ApplicationController
  before_action :search_restaurant, only: %i[search]
  def index
    @full_ads = FullAd.all
  end

  def search
    @ads = Ad.all
    @q = params[:q]
  end

  private

  def search_restaurant
    @places = Restaurant.joins(:cuisine)
                        .where('cuisines.name LIKE ?', "%#{params[:q]}%")
                        .or(Restaurant.joins(:cuisine)
                        .where('restaurants.name LIKE ?', "%#{params[:q]}%"))
                        .or(Restaurant.joins(:cuisine)
                        .where('address LIKE ?', "%#{params[:q]}%"))
                        .or(Restaurant.joins(:cuisine)
                        .where('neighborhood LIKE ?', "%#{params[:q]}%"))
  end
end
