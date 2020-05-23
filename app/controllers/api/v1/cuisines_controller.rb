class Api::V1::CuisinesController < Api::V1::ApiController

  def index
    @cuisines = Cuisine.all
    render json: @cuisines, status: :ok
  end

end