class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_group

  validates :user, presence: true
  validates :chat_group, presence: true
  validates :body, presence: true
end
