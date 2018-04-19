class Admin::ThreatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]

  before_action :require_is_admin

  def show
    @threat = Threat.find(params[:id])
  end
  def index
    @threats = Threat.all
  end
  def new
    @threat = Threat.new
  end
  def create
    @threat = Threat.new(threat_params)
    if @threat.save
      redirect_to admin_threats_path
    else
      render :new
    end
  end
  def edit
    @threat = Threat.find(params[:id])
  end
  def update
    @threat = Threat.find(params[:id])
    if @threat.update(threat_params)
      redirect_to admin_threats_path
    else
      render :edit
    end
  end
  def destroy
    @threat = Threat.find(params[:id])
    @threat.destroy
    redirect_to admin_threats_path
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  private
  
  def threat_params
    params.require(:threat).permit(:title, :description) end
end
