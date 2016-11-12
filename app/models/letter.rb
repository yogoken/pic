class Letter < ApplicationRecord
  has_many :comments, ->{ order("likes_count desc") }, dependent: :destroy
  belongs_to :group
  validates :url, format: URI::regexp(%w(http https))

  def user_comment(user)
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

  def user_comment(user)
    comments.find_by(user_id: user.id)
  end

  def max_like_user
    comment = comments.order("likes_count desc").first(1)[0]
    if comment.nil?
      nil
    else
      User.find(comment.user_id)
    end
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
