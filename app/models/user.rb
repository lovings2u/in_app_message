class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :homes
  has_many :send_conversations, foreign_key: :sender_id, class_name: "Conversation"
  has_many :receipt_conversations, foreign_key: :recipient_id, class_name: "Conversation"
  has_many :senders, through: :receipt_conversations, source: :sender
  has_many :recipients, through: :send_conversations, source: :recipient
end
