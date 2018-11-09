class HeroinesController < ApplicationController
  before_action :find_heroine, only: :show
  before_action :find_powers, only: %i[index new]

  def index 
    # find_powers
    @heroines = params[:q] ? Heroine.by_power(params[:q]) : Heroine.all
  end

  def show
    # find_heroine
  end

  def new
    # find_powers
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def find_powers
    @powers = Power.all
  end
end
