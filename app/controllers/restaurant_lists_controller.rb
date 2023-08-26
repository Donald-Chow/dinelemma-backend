class RestaurantListsController < ApplicationController
  before_action :set_restaurant_list, except: %i[create index]

  def index
    @restaurant_lists = policy_scope(Restaurant_List)

    render json: {
      status: :ok,
      data: @restaurant_lists
    }
  end

  def show
    authorize @restaurant_list

    render json: {
      status: :ok,
      data: @restaurant_list
    }
  end

  def create
    @restaurant_list = Restaurant_List.new(restaurant_list_params)
    @restaurant_list.user = current_user
    authorize @restaurant_list

    if @restaurant_list.save
      render json: {
        status: { code: 200, message: "Restaurant List Created" },
        data: @restaurant_list
      }
    else
      render json: { errors: @restaurant_list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @restaurant_list

    if @restaurant_list.update(restaurant_list_params)
      render json: {
        status: { code: 200, message: "Restaurant List Updated" },
        data: @restaurant_list
      }
    else
      render json: { errors: @restaurant_list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @restaurant_list

    if @restaurant_list.destroy
      render json: {
        status: { code: 200, message: "Restaurant List Destroyed" }
        # redirect?
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def restaurant_list_params
    params.require(:restaurant_list).permit(:name)
  end

  def set_restaurant_list
    @restaurant_list = Restaurant_List.find(params[:id])
  end
end
