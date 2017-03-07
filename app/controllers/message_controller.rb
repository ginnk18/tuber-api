class MessageController < ApplicationController
   # before_action :require_signed_in, only: :create

  def create
    message = Message.new(message_params)
    # message.sender_id = current_user.id

    if message.save
      receiver = Tutor.find(message.receiver_id)
      broadcast_message_data = build_brodcast_message_data(message, receiver)

      # One sided broadcast only to receiver
      ActionCable.server.broadcast(
        "notifications_#{receiver.id}",
        broadcast_message_data)

      ActionCable.server.broadcast(
        "messages_#{message.sender_id}_#{receiver.id}",
        broadcast_message_data) unless message.sender_id == receiver.id
    else
      render json: {status: "cant save that"}, status: :bad_request
    end
  end

  def sms
    message = {
      to: params[:to],
      body: params[:body]
    }
    send_sms(message)
  end

  private

  def message_params
    params.require(:message).permit(:text, :receiver_id)
      .merge(params.permit(:dialog_id))
  end

  def build_brodcast_message_data(message, receiver)
    {
        id: message.id,
        sender: "Izzo",
        receiver: "Manizo",
        sender_id: message.sender_id,
        receiver_id: message.receiver_id,
        text: message.text,
        created_at: message.created_at
    }
  end

  def send_sms(messageHash)
    require 'twilio-ruby'
    # put your own credentials here
    account_sid = 'AC654a50b58eda22d52711a0dce2823bc2'
    auth_token = '308769e85dfeabcef741ed6853b6ea47'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    messageHash[:from] = '+17053040070'
    @client.messages.create(messageHash)
  end
end