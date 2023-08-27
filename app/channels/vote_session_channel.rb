class VoteSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote_session_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
