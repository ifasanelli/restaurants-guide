class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_super_admin
  before_action :load_data, only: %i[index]

  def index
    @rating_per_restaurant = @ratings.count / @restaurants.count.to_f
    @comments_per_restaurant = @comments.count / @restaurants.count.to_f
    @data_c = Comment.group(:status).count
    @data_r = Rating.group(:star).count
  end

  def set_admin
    @user = User.find(params[:user_id])
    @user.update(role: :admin)
    flash[:notice] = "Usuário #{@user.name} agora é admin!"
    redirect_to users_path
  end

  def set_visitor
    @user = User.find(params[:user_id])
    @user.update(role: :visitor)
    flash[:alert] = "Usuário #{@user.name} NÃO é mais admin!"
    redirect_to users_path
  end

  private

  def check_super_admin
    unless current_user&.superadmin?
      flash[:alert] = 'Você não tem permissão para esta página!'
      redirect_to root_path
    end
  end

  def load_data
    @users = User.all
    @comments = Comment.all
    @ratings = Rating.all
    @restaurants = Restaurant.all
  end
end
