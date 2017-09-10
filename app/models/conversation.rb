class Conversation < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"
  validates :recipient_id, presence: true
  validates :sender_id, presence: true

  def send_message(recipient)
    
  end
end
