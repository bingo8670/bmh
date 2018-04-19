class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:eamil)
  end
end