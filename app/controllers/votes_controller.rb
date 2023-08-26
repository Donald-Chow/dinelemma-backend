class VotesController < ApplicationController
  respond_to :json

  def update
    @vote = Vote.find(params[:id])
    authorize @vote
    if @vote.update(vote_params)
      render json: {
        status: { code: 200, message: "Vote accepted." },
        data: @vote
      }
    else
      render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:result)
  end
end
