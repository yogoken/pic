class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment, counter_cache: true
end
