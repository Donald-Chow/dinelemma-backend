class ListBookmarksController < ApplicationController
  before_action :set_list_bookmark, only: %i[destroy]

  def create
    @list_bookmark = ListBookmark.new(list_bookmark_params)
    authorize @list_bookmark
    restaurant = find_or_create_restaurant(params[:restaurant][:place_id])
    @list_bookmark.restaurant = restaurant
    if @list_bookmark.save
      render json: { bookmark: @list_bookmark }, status: :ok, message: "Bookmark Created"
    else
      render json: { errors: @list_bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @list_bookmark

    if @list_bookmark.destroy
      render json: {
        status: :ok, message: "Bookmark Destroyed"
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def list_bookmark_params
    params.require(:list_bookmark).permit(:restaurant_list_id)
  end

  def set_list_bookmark
    @list_bookmark = ListBookmark.find(params[:id])
  end

  def find_or_create_restaurant(place_id)
    return Restaurant.find_by(place_id:) if Restaurant.find_by(place_id:)

    GooglePlaces.new(place_id).create_restaurant
  end
end
