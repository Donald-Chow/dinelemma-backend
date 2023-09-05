class VotesController < ApplicationController
  respond_to :json

  def update
    @vote = Vote.find(params[:id])
    authorize @vote

    if @vote.update(vote_params)
      check_success_and_update(@vote)

      render json: { status: { code: 200, message: "Vote accepted." }, data: @vote }
    else
      render json: { errors: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:result)
  end

  def check_success_and_update(vote)
    vote_session = vote.vote_session
    return if vote_session.restaurant.present?

    if vote_successful?(vote_session, vote.restaurant)
      set_restaurant_and_broadcast(vote_session, vote.restaurant)
    end
  end

  def vote_successful?(vote_session, restaurant)
    related_votes = vote_session.votes.where(restaurant: )
    success_count = related_votes.count { |vote| vote.super? || vote.yes? }
    success_count == related_votes.count
  end

  def set_restaurant_and_broadcast(vote_session, restaurant)
    vote_session.update(restaurant: )
    ActionCable.server.broadcast "vote_session_#{vote_session.id}", { vote_session: }
  end
end
