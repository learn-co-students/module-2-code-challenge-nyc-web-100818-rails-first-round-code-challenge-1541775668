class HeroinesController < ApplicationController
  before_action :find_heroine, only:[:show]

  def index
    @heroines = Heroine.search(params[:search])
  end

  def show
    @powers = Power.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine #show page
    else
      flash[:errors]= @heroine.errors.full_messages
      redirect_to new_heroine_path #new page w/error message
    end
  end

private

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end



end
