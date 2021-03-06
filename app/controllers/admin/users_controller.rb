class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "删除成功"
    redirect_to admin_users_path
  end

  def password
    @user = User.find(params[:id])
  end

  def update_password
    @user = User.find(params[:id])
    @user.reset_password_token = 'temp'
    @user.save!
    if @user.reset_password(params[:password], params[:password_confirmation])
      Notifier.admin_password_change(@user).deliver
      flash[:success] = "Password Changed ! "
      redirect_to update_password_admin_user_path(@user)
    else
      render "password"
      flash[:alert] = "Password Changed ? "
    end
  end

  protected

  def user_params
    params.require(:user).permit(:user, :email, :name, :sex, :age, :position, :password, :password_confirmation)
  end
end
