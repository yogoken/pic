class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, ->{ order("updated_at desc") }, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
end
