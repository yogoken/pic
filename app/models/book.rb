# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  title        :string(255)      not null
#  image        :string(255)      default(""), not null
#  author       :string(255)      default(""), not null
#  manufacturer :string(255)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  url          :text(65535)
#

class Book < ApplicationRecord
  belongs_to :user
  has_many :impressions, ->{ order('created_at desc') }

  def impression(user)
    Impression.find_by(user_id: user, book_id: id)
  end

  def self.search_book(key)
    if key.present?
      Amazon::Ecs.debug = true

      books = Amazon::Ecs.item_search(
        key,
        search_index: 'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country: 'jp',
        power: 'Not kindle'
      )

      search_books = []
      books.items.each do |item|
        book = self.new(
          title: item.get('ItemAttributes/Title'),
          image: item.get('LargeImage/URL'),
          url: item.get('DetailPageURL'),
          author: item.get('ItemAttributes/Author'),
          manufacturer: item.get('ItemAttributes/Manufacturer'),
        )
        search_books.push(book)
      end
      return search_books
    end
  end
end
