class RestaurantsController < ApplicationController
  before_action :set_restaurant, except: %i[create index]

  def index
    @restaurants = policy_scope(Restaurant)

    render json: {
      status: :ok,
      data: @restaurants
    }
  end

  def show
    authorize @restaurant

    render json: {
      status: :ok,
      data: @restaurant
    }
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant

    if @restaurant.save
      render json: {
        status: { code: 200, message: "Restaurant Created" },
        data: @restaurant
      }
    else
      render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @restaurant

    if @restaurant.update(restaurant_params)
      render json: {
        status: { code: 200, message: "Restaurant Updated" },
        data: @restaurant
      }
    else
      render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:group).permit(:name, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
