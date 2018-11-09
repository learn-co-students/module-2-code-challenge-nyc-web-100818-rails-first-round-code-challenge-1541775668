class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find_by(params[:id])
    # redirect_to power_path
  end


end
