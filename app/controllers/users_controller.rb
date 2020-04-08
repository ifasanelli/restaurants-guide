class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_super_admin

  def index
    @users = User.all
  end

  def set_admin
    @user = User.find(params[:user_id])
    @user.update_attributes(role: :admin)
    flash[:notice] = "Usuário #{@user.name} agora é admin!"
    redirect_to users_path
  end

  def set_visitor
    @user = User.find(params[:user_id])
    @user.update_attributes(role: :visitor)
    flash[:alert] = "Usuário #{@user.name} NÃO é mais admin!"
    redirect_to users_path
  end

  private

  def check_super_admin
    unless current_user && current_user.superadmin?
      flash[:alert] = "Você não tem permissão para esta página!"
      redirect_to root_path
    end
  end

end