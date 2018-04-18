class ThreatsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  def index
    @threats = Threat.all
  end
  def show
    @threat = Threat.find(params[:id])
  end
  def new
    @threat = Threat.new
  end
  def edit
    @threat = Threat.find(params[:id])
  end
  def create
    @threat = Threat.new(threat_params)

    if @threat.save
      redirect_to threats_path
    else
      render :new
    end
  end
  def update
    @threat = Threat.find(params[:id])

    if @threat.update(threat_params)
      redirect_to threats_path, notice: "更新成功"
    else
      render :edit
    end
  end
  def destroy
    @threat = Threat.find(params[:id])
    @threat.destroy
    flash[:alert] = "删除成功"
    redirect_to threats_path
  end

  private
    def threat_params
      params.require(:threat).permit(:title, :description)
    end

end
