class CuisinesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cuisine, only: %i[show edit update]
  before_action :check_admin

  def index
    @cuisines = Cuisine.all
  end

  def show; end

  def new
    @cuisine = Cuisine.new
  end

  def edit; end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      flash[:notice] = 'Cozinha criada com sucesso!'
      redirect_to @cuisine
    else
      render :new
    end
  end

  def update
    if @cuisine.update(cuisine_params)
      flash[:notice] = 'Cozinha atualizada com sucesso!'
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

  def check_admin
    unless current_user.admin? || current_user.superadmin?
      flash[:alert] = "Você não tem permissão para esta página!"
      redirect_to new_user_session_path
    end
  end
end
