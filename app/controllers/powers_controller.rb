class PowersController < ApplicationController
  before_action :find_power, only: [:show] #, :edit, :update, :destroy]

  def index
    @powers = Power.all
  end

  def show
    #before_action
  end

  # def new
  #   @power = Power.new
  # end
  #
  # def create
  #   @power = Power.create(power_params)
  #   redirect_to @power
  # end
  #
  # def edit
  #   #before_action
  # end
  #
  # def update
  #   @power.update(power_params)
  #   redirect_to @power
  # end
  #
  # def destroy
  #   @power.destroy
  #   # redirect_to
  # end

  private

  def find_power
    @power = Power.all.find_by(id: params[:id])
  end

  # def power_params
  #   params.require(:power).permit(:name, :description)
  # end

end
