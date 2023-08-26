class VoteSessionsController < ApplicationController
  before_action :set_vote_session, only: %i[show update]
  def show
    authorize @vote_session
    @votes = @vote_session.votes.where(user: current_user).where(result: nil).shuffle if @vote_session.start

    render json: {
      status: :ok,
      data: {
        vote_session: @vote_session,
        votes: @votes
      }
    }
  end

  def create
    @vote_session = VoteSession.new(vote_session_params)
    authorize @vote_session
    if @vote_session.save
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
    if @vote_session.update(vote_session_params)
      create_votes(@vote_session) if @vote_session.start

      render json: {
        status: { code: 200, message: "Vote session Updated" },
        data: @vote_session
      }
    else
      render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_session_params
    params.require(:vote_session).permit(:name, :restaurant_list_id, :group_id, :start)
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
