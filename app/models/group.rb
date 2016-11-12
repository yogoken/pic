class Group < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :letters, dependent: :destroy

  validates :name, presence: true
  validates :key,  presence: true, length: { minimum: 4 }

  def whether_existing?(key, name)
    if Group.find_by(key: key, name: name)
      return false
    else
      return true
    end
  end
end
