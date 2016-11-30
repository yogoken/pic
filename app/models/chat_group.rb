class ChatGroup < ApplicationRecord
  has_many :chat_group_users
  has_many :messages
  has_many :users, through: :chat_group_users
  accepts_nested_attributes_for :users

  validates :name, presence: true
  validates :users, presence: true
end
