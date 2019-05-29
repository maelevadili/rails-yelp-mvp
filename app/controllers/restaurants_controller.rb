class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # 1. Construire un object Restaurant a partir de params[:restaurant]
    @restaurant = Restaurant.new(restaurant_params)
    # 2. Sauver l'objet en DB
    if @restaurant.save
    # 3. Redirige vers la liste des restaurants
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

