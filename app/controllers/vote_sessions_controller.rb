class VoteSessionsController < ApplicationController
  before_action :set_vote_session, only: %i[show update]
  def show
    authorize @vote_session
  end

  def create
    @vote_session = VoteSession.new(vote_session_params)
    authorize @vote_session
    if @vote_session.save
      create_votes(@vote_session)
      render json: {
        status: { code: 200, message: "Vote Session Created" },
        data: @vote_session
      }
    else
      render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @vote_session
  end

  private

  def vote_session_params
    params.require(:vote_session).permit(:name, :restaurant_list_id, :restaurant_id, :group_id)
  end

  def set_vote_session
    @vote_session = VoteSession.find(params[:id])
  end

  def create_votes(vote_session)
    restaurants = vote_session.list_restaurants
    users = vote_session.users
    users.each do |user|
      restaurants.each do |restaurant|
        Vote.create(user:, vote_session:, restaurant:)
      end
    end
  end
end
