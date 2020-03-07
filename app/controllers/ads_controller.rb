class AdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end
end
