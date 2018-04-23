class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update, :edit]
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

  protected

  def user_params
    params.require(:user).permit(:email, :name, :sex, :age, :position)
  end
end
