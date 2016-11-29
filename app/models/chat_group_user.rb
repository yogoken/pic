class ChatGroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat_group

  validates :user, presence: true
  validates :chat_group, presence: true
end
