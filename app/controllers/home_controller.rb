class HomeController < ApplicationController
  before_action :search_restaurant, only: %i[search]
  def index
    @full_ads = FullAd.all
  end

  def sobre; end

  def contato; end

  def search
    @ads = Ad.all
    @q = params[:q]
    @custom_renderer = Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        { class: 'custom_pagination mt-5' }
      end
    end
  end

  private

  def search_restaurant
    @places = Restaurant.joins(:cuisine)
                        .where('cuisines.name ILIKE ?', "%#{params[:q]}%")
                        .or(Restaurant.joins(:cuisine)
                        .where('restaurants.name ILIKE ?', "%#{params[:q]}%"))
                        .or(Restaurant.joins(:cuisine)
                        .where('address ILIKE ?', "%#{params[:q]}%"))
                        .or(Restaurant.joins(:cuisine)
                        .where('neighborhood ILIKE ?', "%#{params[:q]}%"))
                        .paginate(page: params[:page], per_page: 5)
  end
end
