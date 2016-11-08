class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :letter, counter_cache: true
  has_many :likes, dependent: :destroy

  def user_like(user)
    self.likes.find_by(user_id: user.id)
  end
end

