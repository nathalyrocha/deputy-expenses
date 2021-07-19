class DeputyChannel < ApplicationCable::Channel
  def subscribed
    @deputy = Deputy.first
    stream_from 'deputy_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
