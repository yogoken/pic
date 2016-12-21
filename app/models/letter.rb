# == Schema Information
#
# Table name: letters
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  image          :string(255)
#  url            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default(0)
#  site_name      :string(255)
#

class Letter < ApplicationRecord
  has_many :comments, ->{ order("likes_count desc") }, dependent: :destroy
  has_many :storages, dependent: :destroy

  validates :url, format: URI::regexp(%w(http https))
  paginates_per 12

  def comments_by(user)
    comments.find_by(user_id: user.id)
  end

  def created_in_24hours?
    now = Time.now
    if (now - 24 * 60 * 60) <= self.created_at.time && self.created_at.time <= now
      true
    else
      nil
    end
  end

  def created_time
    d = self.created_at
    "#{d.year}年#{d.month}月#{d.day}日"
  end

  def best_seven_comments
    comments.first(7)
  end

  def create_letter
    agent = Mechanize.new
    page = agent.get(self.url)
    elements = page.search('meta')
    letter = {}
    elements.each do |ele|
      property = ele.get_attribute(:property)
      if property == "og:title"
        letter[:title] = ele.get_attribute(:content)
      elsif property == "og:image"
        letter[:image] = ele.get_attribute(:content)
      elsif property == "og:site_name"
        letter[:site_name] = ele.get_attribute(:content)
      end
    end
    self.update(letter)
  end
end
