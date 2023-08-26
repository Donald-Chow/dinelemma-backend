class ListBookmarksController < ApplicationController
  before_action :set_list_bookmark, only: %i[destroy]

  def create
    @list_bookmark = ListBookmark.new(list_bookmark_params)
    authorize @list_bookmark
    if @list_bookmark.save
      render json: {
        status: { code: 200, message: "Bookmark Created" },
        data: @list_bookmark
      }
    else
      render json: { errors: @list_bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @list_bookmark

    if @list_bookmark.destroy
      render json: {
        status: { code: 200, message: "Bookmark Destroyed" }
        # redirect?
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def list_bookmark_params
    params.require(:list_bookmark).permit(:restaurant_list_id, :restaurant_id)
  end

  def set_list_bookmark
    @list_bookmark = ListBookmark.find(params[:id])
  end
end
