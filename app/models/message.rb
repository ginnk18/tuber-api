class Message < ApplicationRecord
  belongs_to :sender, class_name: 'Tutor'
  belongs_to :receiver, class_name: 'Tutor'

  alias_attribute :conversation_id, :receiver_id

  validates :text, presence: true, length: { minimum: 1 }

  def self.get_conversation(sender, receiver)
    where(sender_id: sender.id, receiver_id: receiver.id)
      .or(where(sender_id: receiver.id, receiver_id: sender.id))
      .includes(:sender, :receiver)
  end
end
