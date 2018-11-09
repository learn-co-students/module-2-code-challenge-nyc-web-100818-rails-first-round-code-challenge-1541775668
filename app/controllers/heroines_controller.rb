class HeroinesController < ApplicationController
  # self.per_form_csrf_tokens = true
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create

    self.per_form_csrf_tokens = true
    @heroine.create(heroine_params)
    redirect_to heroine_path(@heroine)

  end

  def edit
  end

  def update
    @heroine.update(heroine_params)
    redirect_to @heroine
  end

  def destroy
    @heroine.destroy
    redirect_to :@heroines
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

end
