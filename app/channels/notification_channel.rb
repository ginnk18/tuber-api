# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_#{params[:sender_id]}"
  end

  def newNotification(data)
    ActionCable.server.broadcast(
      "notifications_#{data["receiver_id"]}",
      data)

    ActionCable.server.broadcast(
      "notifications_#{data["sender_id"]}",
      data) unless data["sender_id"] == data["receiver_id"]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
