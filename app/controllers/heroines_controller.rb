class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit] #:update, :destroy]

  def index
    @heroines = Heroine.all
  end

  def show
    #before_action
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to @heroine
  end

  # def edit
  #   #before_action
  # end

  # def update
  #   @heroine.update(heroine_params)
  #   redirect_to @heroine
  # end

  # def destroy
  #   @heroine.destroy
  #   # redirect_to
  # end

  private

  def find_heroine
    @heroine = Heroine.all.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :description, :power_id)
  end

end
