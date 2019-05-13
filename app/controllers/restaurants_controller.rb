class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
   @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit          # GET /restaurants/:id/edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
  end

  def restaurant_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:restaurant).permit(:name, :address)
  end

  def destroy       # DELETE /restaurants/:id
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

    private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
