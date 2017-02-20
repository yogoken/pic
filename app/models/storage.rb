# == Schema Information
#
# Table name: storages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  letter_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Storage < ActiveRecord::Base
  belongs_to :user
  belongs_to :letter

  STORAGE_MAX = 5

  validate :user_storage_size_validate

  def user_storage_size_validate
    if self.user && self.user.storages.size >= STORAGE_MAX
      errors.add(:base, "ニュース保管登録は5つまでです。")
    end
  end
end
