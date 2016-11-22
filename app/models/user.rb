class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, ->{ order('updated_at desc') }, dependent: :destroy
  has_many :likes,                                    dependent: :destroy
  has_many :books,    ->{ order('created_at desc') }
  has_many :storages, ->{ order('created_at desc') }
  has_many :impressions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

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
