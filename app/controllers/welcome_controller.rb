class WelcomeController < ApplicationController
  def index
    flash[:notice] = "成功"
  end
end
