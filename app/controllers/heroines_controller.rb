class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update]

  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def new
    #creates an empty object instance to be passed to the form
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine.id) #could also be 'redirect_to @heroine' or 'redirect_to heroine_path(@heroine)'
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
    #code
  end

  def edit
    #like the new action, gives the form access to all of the powers
    @powers = Power.all
  end

  def update
    @heroine.update(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to edit_heroine_path(@heroine)
    end
  end

  def search
    find_by_power
        redirect_to heroines_path
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  #using find_by for better error handling and possible debugging
  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def find_by_power
    @powers = Power.all
    @search_heroines = Heroine.all
    @powers.each do |power|
      @search_heroines.map {|heroine| params[:sauce] == heroine.power}
    end
    @search_heroines
  end


end
