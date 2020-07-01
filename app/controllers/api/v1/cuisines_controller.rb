module Api
  module V1
    class CuisinesController < Api::V1::ApiController
      def index
        @cuisines = Cuisine.all
        render json: @cuisines, status: :ok
      end
    end
  end
end
