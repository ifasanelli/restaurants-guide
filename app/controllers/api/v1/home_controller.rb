class Api::V1::HomeController < Api::V1::ApiController

  def search
    @q = params[:q]
    @places = Restaurant.joins(:cuisine)
    .where('cuisines.name ILIKE ?', "%#{params[:q]}%")
    .or(Restaurant.joins(:cuisine)
    .where('restaurants.name ILIKE ?', "%#{params[:q]}%"))
    .or(Restaurant.joins(:cuisine)
    .where('address ILIKE ?', "%#{params[:q]}%"))
    .or(Restaurant.joins(:cuisine)
    .where('neighborhood ILIKE ?', "%#{params[:q]}%"))
    render json: @places, status: :ok
  end

end




