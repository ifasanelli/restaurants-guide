class CuisinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cuisines = Cuisine.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end
end
