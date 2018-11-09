class HeroinesController < ApplicationController
  before_action :find_heroine, only: %i(show)

  def index
    @heroines = Heroine.all
    ### I got close but couldn't get the following code to work
    # if params[:power]
    # @heroines = Heroine.where('store LIKE ?', "%#{params[:powers]}%")
    # else
    # @heroines = Heroine.all
    # end
  end

  def show
    #code
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  # def edit
  #   #code
  # end
  #
  # def update
  #   #code
  # end
  #
  # def destroy
  #   @heroine.destroy
  #   redirect_to heroines_path
  # end

  #commented out because deliverables did not request these methods

  private

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power)
    # params.require(:heroine).permit(:name, :super_name, :power_id, :power)
  end

end
