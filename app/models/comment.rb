# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  content     :string(255)
#  user_id     :integer
#  letter_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  likes_count :integer          default(0)
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :letter, counter_cache: true
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  def likes_by(user)
    likes.find_by(user_id: user.id)
  end
end
