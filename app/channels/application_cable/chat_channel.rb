class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:sender_id]}_#{params[:receiver_id]}"
  end

  def newMessage(data)
    message = Message.new
    message.sender_id = params[:sender_id]
    message.receiver_id = params[:receiver_id]
    message.text = data[:text]

    if message.save
      # receiver = Tutor.find(message.receiver_id)
      # broadcast_message_data = build_brodcast_message_data(message)

      # One sided broadcast only to receiver
      # ActionCable.server.broadcast(
      #   "notifications_#{receiver.id}",
      #   broadcast_message_data)
      begin
        ActionCable.server.broadcast(
          "messages_#{params[:receiver_id]}_#{params[:sender_id]}",
          data)
      rescue
        puts "Error occured"
      end
    end
    # else
    #   render json: {status: "cant save that"}, status: :bad_request
    # end
  end

  # private

  # def message_params
  #   params.require(:message).permit(:text, :sender_id, :receiver_id)
  #     # .merge(params.permit(:dialog_id))
  # end

  # def build_brodcast_message_data(message)
  #   {
  #       id: message.id,
  #       sender_id: message.sender_id,
  #       receiver_id: message.receiver_id,
  #       text: message.text,
  #       message: message.text,
  #       timestamp: message.created_at,
  #       username: "Izzo #{message.sender_id}",
  #       created_at: message.created_at
  #   }
  # end

  def unsubscribe
  end
end
