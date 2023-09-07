class GroupChannel < ApplicationCable::Channel
  def subscribed
    group = Group.find(params[:id])
    stream_for group
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
