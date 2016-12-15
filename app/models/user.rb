# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nickname               :string(255)
#  avatar                 :string(255)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, ->{ order('updated_at desc') }, dependent: :destroy
  has_many :likes,                                    dependent: :destroy
  has_many :books,    ->{ order('created_at desc') }
  has_many :storages, ->{ order('created_at desc') }
  has_many :impressions
  has_many :messages
  has_many :chat_groups, through: :chat_group_users
  has_many :chat_group_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :nickname, presence: true, length:     { maximum: 15 }
  validates :email,    presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, length:     { minimum: 6 }

  def user_letters
    letters = []
    self.comments.each do |comment|
      letters << comment.letter
    end
    letters
  end

  def sum_like
    sum_likes = 0
    self.comments.each do |comment|
      sum_likes += comment.likes.length
    end
    sum_likes
  end

  def storage_letters
    letters = []
    self.storages.each do |storage|
      letters.push(storage.letter)
    end
    letters.reject(&:blank?)
  end
end
