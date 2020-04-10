class HomeController < ApplicationController
  before_action :search_restaurant, only: %i[search]
  def index
    @full_ads = FullAd.all
  end

  def search
    @ads = Ad.all
    @q = params[:q]
    @custom_renderer = Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {class: "custom_pagination mt-5"}
      end
    end
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
                        .paginate(page: params[:page], per_page: 1)
  end
end
