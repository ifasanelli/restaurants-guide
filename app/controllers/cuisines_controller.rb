class CuisinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cuisine, only: %i[show edit update]

  def index
    @cuisines = Cuisine.all
  end

  def show; end

  def edit; end

  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      render :edit
    end
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def find_cuisine
    @cuisine = Cuisine.find(params[:id])
  end
end
