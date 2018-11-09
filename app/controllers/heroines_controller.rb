class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show]

  def index # something has to go in here for the bonus but idk syntax
    # if my param (:power_name) that i made up is passed through
    if params[:power_name]
      power = Power.find_by(name: params[:power_name]) # then find that power by it's name
      # find the heroines with that power
      @heroines = Heroine.where(power: power) # found this syntax here: https://rubyplus.com/articles/3381-Simple-Search-Form-in-Rails-5
    else
      @heroines = Heroine.all # otherwise show all the heroines?
      # issue is when i type in a power that does not exist and refresh, i don't get back to index, i just stay on that page
    end
  end

  def show
    # @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all # give new view access to this variable
  end

  def create # going to need to VALIDATE
    @heroine = Heroine.new(heroine_params) # are ur params valid?

    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine) # go to this heroine's show page - can also be @heroine
    else # flash hash
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path # redirect to new form
    end
  end

  private

  def heroine_params # https://rubyplus.com/articles/3381-Simple-Search-Form-in-Rails-5 said to add :search to the params but it seems to work without it too...
    # confused on how the search functionality work when :search is NOT in here but leaving it in to b safe
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

end # end of Controller
