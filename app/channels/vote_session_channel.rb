class VoteSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote_session_#{params[:id]}"
    logger.info "#{current_user.name} subscribed to VoteSessionChannel for vote_session_#{vote_session.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
