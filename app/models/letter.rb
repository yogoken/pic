class Letter < ApplicationRecord
  validates :url, format: URI::regexp(%w(http https))
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
      end
    end
    self.update(letter)
  end
end
