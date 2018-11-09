class PowersController < ApplicationController
  before_action :find_power, only: %i[show edit update]

  def index
    @powers = Power.all
  end

  def show
    
  end

  private

  def find_power
    @power = Power.find_by(id: params[:id])
  end
end
