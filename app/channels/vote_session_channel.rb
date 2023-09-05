class VoteSessionChannel < ApplicationCable::Channel
  def subscribed
    vote_session = VoteSession.find(params[:id])
    stream_for vote_session  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
