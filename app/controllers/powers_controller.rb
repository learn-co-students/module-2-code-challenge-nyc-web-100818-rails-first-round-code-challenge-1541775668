class PowersController < ApplicationController
  before_action :find_power, only: [:show, :destroy, :edit, :update]

  def index
    @powers = Power.all
    @power = Power.find_by(name: params[:q])
    if @power
      redirect_to @power
    else
      flash[:errors] = "Could Not Find Power "
      redirect_to heroines_path
    end
  end

  def show
    @heroines = @power.heroines
  end

  def new
    @power = Power.new
    @heroines = Heroine.all
  end

  def create
    ### METHOD NOT FINISHED 
    @power = Power.create(power_params)
    params[:power][:heroine_ids].each do |heroine_id|
      h = Heroine.find_by(id: heroine_id)
      h.update(power_id: @power.id)
    end
  end

  def update
    #code
  end

  def edit
    #code
  end

  def destroy
    @power.destroy
    redirect_to powers_path
  end

  private

  def find_power
    @power = Power.find_by(id: params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description, heroine_ids:[])
  end
end
