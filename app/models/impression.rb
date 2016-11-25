# == Schema Information
#
# Table name: impressions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Impression < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
