class VoteSessionsController < ApplicationController
  before_action :set_vote_session, only: %i[show update]

  def show
    authorize @vote_session
    votes = @vote_session.votes.where(user: current_user).where(result: nil).shuffle
    render json: {
      vote_session: @vote_session.as_json(include: :restaurant),
      votes: votes.as_json(include: :restaurant)
    }, status: :ok
  end

  def create
    @vote_session = VoteSession.new(vote_session_params)
    authorize @vote_session
    if @vote_session.save
      create_votes(@vote_session)
      render json: { active_session: @vote_session }, status: :ok, message: "Vote Session Created"
      GroupChannel.broadcast_to(@vote_session.group, { vote_session: @vote_session, message: "Session Started" })
    else
      render json: { errors: @vote_session.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def update
  #   authorize @vote_session
  #   if @vote_session.update(vote_session_params)
  #     create_votes(@vote_session) if @vote_session.start

  #     render json: { data: @vote_session }, status: { code: 200, message: "Vote session Updated" }
  #   else
  #     render json: { errors: @vote_session.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

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
